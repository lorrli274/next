# Express Tutorial Part 3: Using a Database (with Mongoose) - Learn web development

This article briefly introduces databases, and how to use them with Node/Express apps. It then goes on to show how we can use Mongoose to provide database access for the LocalLibrary website. It explains how object schema and models are declared, the main field types, and basic validation. It also briefly shows a few of the main ways in which you can access model data.

## Overview

Library staff will use the Local Library website to store information about books and borrowers, while library members will use it to browse and search for books, find out whether there are any copies available, and then reserve or borrow them. In order to store and retrieve information efficiently, we will store it in a _database_.

Express apps can use many different databases, and there are several approaches you can use for performing **C**reate, **R**ead, **U**pdate and **D**elete (CRUD) operations. This tutorial provides a brief overview of some of the available options, and then goes on to show in detail the particular mechanisms selected.

### What Databases Can I Use?

_Express_ apps can use any database supported by _Node_ (_Express_ itself doesn't define any specific additional behaviour/requirements for database management). There are many popular options, including PostgreSQL, MySQL, Redis, SQLite, and MongoDB.

When choosing a database, you should consider things like time-to-productivity/learning curve, performance, ease of replication/backup, cost, community support, etc. While there is no single "best" database, almost any of the popular solutions should be more than acceptable for a small-to-medium-sized site like our Local Library.

### What Is the Best Way To Interact With a Database?

There are two approaches for interacting with a database: 

* Using the databases' native query language (e.g. SQL)
* Using an Object Data Model ("ODM") / Object Relational Model ("ORM"). An ODM/ORM represents the website's data as JavaScript objects, which are then mapped to the underlying database. Some ORMs are tied to a specific database, while others provide a database-agnostic backend.

The very best _performance_ can be gained by using SQL, or whatever query language is supported by the database. ODM's are often slower because they use translation code to map between objects and the database format, which may not use the most efficient database queries (this is particularly true if the ODM supports different database backends, and must make greater compromises in terms of what database features are supported).

The benefit of using an ORM is that programmers can continue to think in terms of JavaScript objects rather than database semantics — this is particularly true if you need to work with different databases (on either the same or different websites). They also provide an obvious place to perform validation and checking of data.

Using ODM/ORMs often results in lower costs for development and maintenance! Unless you're very familiar with the native query language or performance is paramount, you should strongly consider using an ODM.

### What ORM/ODM Should I Use?

There are many ODM/ORM solutions available on the NPM package manager site (check out the odm and orm tags for a subset!).

A few solutions that were popular at the time of writing are:

* Mongoose: Mongoose is a MongoDB object modeling tool designed to work in an asynchronous environment.
* Waterline: An ORM extracted from the Express-based Sails web framework. It provides a uniform API for accessing numerous different databases, including Redis, mySQL, LDAP, MongoDB, and Postgres.
* Bookshelf: Features both promise-based and traditional callback interfaces, providing transaction support, eager/nested-eager relation loading, polymorphic associations, and support for one-to-one, one-to-many, and many-to-many relations. Works with PostgreSQL, MySQL, and SQLite3.
* Objection: Makes it as easy as possible to use the full power of SQL and the underlying database engine (supports SQLite3, Postgres, and MySQL).
* Sequelize: is a promise-based ORM for Node.js and io.js. It supports the dialects PostgreSQL, MySQL, MariaDB, SQLite and MSSQL and features solid transaction support, relations, read replication and more.

As a general rule you should consider both the features provided and the "community activity" (downloads, contributions, bug reports, quality of documentation, etc.) when selecting a solution. At time of writing Mongoose is by far the most popular ORM, and is a reasonable choice if you're using MongoDB for your database.

### Using Mongoose and MongoDb for the LocalLibrary

For the _Local Library_ example (and the rest of this topic) we're going to use the Mongoose ODM to access our library data. Mongoose acts as a front end to MongoDB, an open source NoSQL database that uses a document-oriented data model. A "collection" of "documents", in a MongoDB database, is analogous to a "table" of "rows" in a relational database.

This ODM and database combination is extremely popular in the Node community, partially because the document storage and query system looks very like JSON, and is hence familiar to JavaScript developers.

You don't need to know MongoDB in order to use Mongoose, although parts of the Mongoose documentation _are_ easier to use and understand if you are already familiar with MongoDB.

The rest of this tutorial shows how to define and access the Mongoose schema and models for the LocalLibrary website example.

## Designing the LocalLibrary Models

Before you jump in and start coding the models, it's worth taking a few minutes to think about what data we need to store and the relationships between the different objects.

We know that we need to store information about books (title, summary, author, genre, ISBN) and that we might have multiple copies available (with globally unique ids, availability statuses, etc.). We might need to store more information about the author than just their name, and there might be multiple authors with the same or similar names. We want to be able to sort information based on book title, author, genre, and category.

When designing your models it makes sense to have separate models for every "object" (group of related information). In this case the obvious objects are books, book instances, and authors.

You might also want to use models to represent selection-list options (e.g. like a drop down list of choices), rather than hard coding the choices into the website itself — this is recommended when all the options aren't known up front or may change. The obvious candidate for a model of this type is the book genre (e.g. Science Fiction, French Poetry, etc.)

Once we've decided on our models and fields, we need to think about the relationships between them.

With that in mind, the UML association diagram below shows the models we'll define in this case (as boxes). As discussed above, we've created models for book (the generic details of the book), book instance (status of specific physical copies of the book available in the system), and author. We have also decided to have a model for genre, so that values can be created dynamically. We've decided not to have a model for the `BookInstance:status` — we will hard code the acceptable values because we don't expect these to change. Within each of the boxes you can see the model name, the field names and types, and also the methods and their return types.

The diagram also shows the relationships between the models, including their _multiplicities_. The multiplicities are the numbers on the diagram showing the numbers (maximum and minimum) of each model that may be present in the relationship. For example, the connecting line between the boxes shows that `Book` and a `Genre` are related. The numbers close to the `Book` model show that a book must have zero or more `Genre` (as many as you like), while the numbers on the other end of the line next to the `Genre` show that it can have zero or more associated books.

As discussed in our Mongoose primer below it is often better to have the field that defines the relationship between the documents/models in just _one_ model (you can still find the reverse relationship by searching for the associated `_id` in the other model). Below we have chosen to define the relationship between Book/Genre and Book/Author in the Book schema, and the relationship between the Book/BookInstance in the BookInstance Schema. This choice was somewhat arbitrary — we could equally well have had the field in the other schema.

>DEV: Add image below

The next section provides a basic primer explaining how models are defined and used. As you read it, consider how we will construct each of the models in the diagram above.

## Mongoose Primer

This section provides an overview of how to connect Mongoose to a MongoDB database, how to define a schema and a model, and how to make basic queries. 

### Installing Mongoose and MongoDB

Mongoose is installed in your project (**Package.json**) like any other dependency — using NPM. To install it, use the following command inside your project folder:
    
```js    
npm install mongoose
```    

Installing _Mongoose_ adds all its dependencies, including the MongoDB database driver, but it does not install MongoDB itself. If you want to install a MongoDB server then you can download installers from here for various operating systems and install it locally. You can also use cloud-based MongoDB instances.

For this tutorial we'll be using the mLab cloud-based _database as a service_ sandbox tier to provide the database. This is suitable for development, and makes sense for the tutorial because it makes "installation" operating system independent (database-as-a-service is also one approach you might well use for your production database).

### Connecting to MongoDB

_Mongoose_ requires a connection to a MongoDB database. You can `require()` and connect to a locally hosted database with `mongoose.connect()`, as shown below.
    
 ```js   
//Import the mongoose module
var mongoose = require('mongoose');

//Set up default mongoose connection
var mongoDB = 'mongodb://127.0.0.1/my_database';
mongoose.connect(mongoDB);
// Get Mongoose to use the global promise library
mongoose.Promise = global.Promise;
//Get the default connection
var db = mongoose.connection;

//Bind connection to error event (to get notification of connection errors)
db.on('error', console.error.bind(console, 'MongoDB connection error:'));
```

You can get the default `Connection` object with `mongoose.connection`. Once connected, the open event is fired on the `Connection` instance.

If you need to create additional connections you can use `mongoose.createConnection()`. This takes the same form of database URI (with host, database, port, options etc.) as `connect()` and returns a `Connection` object).

### Defining and Creating Models

Models are _defined_ using the `Schema` interface. The Schema allows you to define the fields stored in each document along with their validation requirements and default values. In addition, you can define static and instance helper methods to make it easier to work with your data types, and also virtual properties that you can use like any other field, but which aren't actually stored in the database (we'll discuss a bit further below).

Schemas are then "compiled" into models using the `mongoose.model()` method. Once you have a model you can use it to find, create, update, and delete objects of the given type.

Each model maps to a _collection_ of _documents_ in the MongoDB database. The documents will contain the fields/schema types defined in the model `Schema`.

#### Defining Schemas

The code fragment below shows how you might define a simple schema. First you `require()` mongoose, then use the Schema constructor to create a new schema instance, defining the various fields inside it in the constructor's object parameter.
    
```js    
//Require Mongoose
var mongoose = require('mongoose');

//Define a schema
var Schema = mongoose.Schema;

var SomeModelSchema = new Schema({
    a_string: String,
    a_date: Date
});
```    

In the case above we just have two fields, a string and a date. In the next sections we will show some of the other field types, validation, and other methods.

#### Creating a Model

Models are created from schemas using the `mongoose.model()` method:
    
```js    
// Define schema
var Schema = mongoose.Schema;

var SomeModelSchema = new Schema({
    a_string: String,
    a_date: Date
});

**// Compile model from schema
var SomeModel = mongoose.model('SomeModel', SomeModelSchema );**
```

The first argument is the singular name of the collection that will be created for your model (Mongoose will create the database collection for the above model _SomeModel_ above), and the second argument is the schema you want to use in creating the model.

Once you've defined your model classes you can use them to create, update, or delete records, and to run queries to get all records or particular subsets of records. We'll show you how to do this in the Using models section, and when we create our views.

#### Schema Types (Fields)

A schema can have an arbitrary number of fields — each one represents a field in the documents stored in _MongoDB_. An example schema showing many of the common field types and how they are declared is shown below.
    
```js    
var schema = new Schema(
{
  name: **String**,
  binary: **Buffer**,
  living: **Boolean**,
  updated: { type: **Date**, default: Date.now },
  age: { type: **Number**, min: 18, max: 65, required: true },
  mixed: **Schema.Types.Mixed**,
  _someId: **Schema.Types.ObjectId**,
  array: **[]**,
  ofString: [**String**], // You can also have an array of each of the other types too.
  nested: { stuff: { type: **String**, lowercase: true, trim: true } }
})
```

Most of the SchemaTypes (the descriptors after "type:" or after field names) are self explanatory. The exceptions are:

* `ObjectId`: Represents specific instances of a model in the database. For example, a book might use this to represent its author object. This will actually contain the unique ID (`_id`) for the specified object. We can use the `populate()` method to pull in the associated information when needed.
* Mixed: An arbitrary schema type.
* []: An array of items. You can perform JavaScript array operations on these models (push, pop, unshift, etc.). The examples above show an array of objects without a specified type and an array of `String` objects, but you can have an array of any type of object.

The code also shows both ways of declaring a field:

* Field _name_ and _type_ as a key-value pair (i.e. as done with fields `name`, `binary `and `living`).
* Field _name_ followed by an object defining the `type`, and any other _options_ for the field. Options include things like: 
    * default values.
    * built-in validators (e.g. max/min values) and custom validation functions.
    * Whether the field is required
    * Whether `String` fields should automatically be set to lowercase, uppercase, or trimmed (e.g. `{ type: **String**, lowercase: true, trim: true }`)

#### Validation

Mongoose provides built-in and custom validators, and synchronous and asynchronous validators. It allows you to specify both the acceptable range or values and the error message for validation failure in all cases.

The built-in validators include:

* All SchemaTypes have the built-in required validator. This is used to specify whether the field must be supplied in order to save a document.
* Numbers have min and max validators.
* Strings have: 
    * enum: specifies the set of allowed values for the field.
    * match: specifies a regular expression that the string must match.
    * maxlength and minlength for the string.

The example below (slightly modified from the Mongoose documents) shows how you can specify some of the validator types and error messages:
    
```js    
var breakfastSchema = new Schema({
  eggs: {
    type: Number,
    min: [6, 'Too few eggs'],
    max: 12
    required: [true, 'Why no eggs?']
  },
  drink: {
    type: String,
    enum: ['Coffee', 'Tea', 'Water',]
  }
});    
```

#### Virtual Properties

Virtual properties are document properties that you can get and set but that do not get persisted to MongoDB. The getters are useful for formatting or combining fields, while setters are useful for de-composing a single value into multiple values for storage. The example in the documentation constructs (and deconstructs) a full name virtual property from a first and last name field, which is easier and cleaner than constructing a full name every time one is used in a template.

We will use a virtual property in the library to define a unique URL for each model record using a path and the record's `_id` value.

#### Methods and Query Helpers

A schema can also have instance methods, static methods, and query helpers. The instance and static methods are similar, but with the obvious difference that an instance method is associated with a particular record and has access to the current object. Query helpers allow you to extend mongoose's chainable query builder API (for example, allowing you to add a query "byName" in addition to the `find()`, `findOne()` and `findById()` methods).

### Using Models

Once you've created a schema you can use it to create models. The model represents a collection of documents in the database that you can search, while the model's instances represent individual documents that you can save and retrieve.

We provide a brief overview below. 

#### Creating and Modifying Documents

To create a record you can define an instance of the model and then call `save()`. The examples below assume SomeModel is a model (with a single field "name") that we have created from our schema.
    
```js    
// Create an instance of model SomeModel
var awesome_instance = new SomeModel({ name: 'awesome' });

// Save the new model instance, passing a callback
awesome_instance.save(function (err) {
  if (err) return handleError(err);
  // saved!
});
```    

Creation of records (along with updates, deletes, and queries) are asynchronous operations — you supply a callback that is called when the operation completes. The API uses the error-first argument convention, so the first argument for the callback will always be an error value (or null). If the API returns some result, this will be provided as the second argument.

You can also use `create()` to define the model instance at the same time as you save it. The callback will return an error for the first argument and the newly-created model instance for the second argument.
    
```js    
SomeModel.create({ name: 'also_awesome' }, function (err, awesome_instance) {
  if (err) return handleError(err);
  // saved!
});
```

Every model has an associated connection (this will be the default connection when you use `mongoose.model()`). You create a new connection and call `.model()` on it to create the documents on a different database.

You can access the fields in this new record using the dot syntax, and change the values. You have to call `save()` or `update()` to store modified values back to the database.
    
```js    
// Access model field values using dot notation
console.log(awesome_instance.name); //should log 'also_awesome'

// Change record by modifying the fields, then calling save().
awesome_instance.name="New cool name";
awesome_instance.save(function (err) {
   if (err) return handleError(err); // saved!
   });
```    

#### Searching for Records

You can search for records using query methods, specifying the query conditions as a JSON document. The code fragment below shows how you might find all athletes in a database that play tennis, returning just the fields for athlete _name_ and _age_. Here we just specify one matching field (sport) but you can add more criteria, specify regular expression criteria, or remove the conditions altogether to return all athletes.
    
```js    
var Athlete = mongoose.model('Athlete', yourSchema);

// find all athletes who play tennis, selecting the 'name' and 'age' fields
Athlete.find({ 'sport': 'Tennis' }, 'name age', function (err, athletes) {
  if (err) return handleError(err);
  // 'athletes' contains the list of athletes that match the criteria.
})
```

If you specify a callback, as shown above, the query will execute immediately. The callback will be invoked when the search completes.

All callbacks in Mongoose use the pattern `callback(error, result)`. If an error occurs executing the query, the `error` parameter will contain an error document, and `result` will be null. If the query is successful, the `error` parameter will be null, and the `result` will be populated with the results of the query.

If you don't specify a callback then the API will return a variable of type Query. You can use this query object to build up your query and then execute it (with a callback) later using the `exec()` method.
    
```js    
// find all athletes that play tennis
var query = Athlete.find({ 'sport': 'Tennis' });

// selecting the 'name' and 'age' fields
query.select('name age');

// limit our results to 5 items
query.limit(5);

// sort by age
query.sort({ age: -1 });

// execute the query at a later time
query.exec(function (err, athletes) {
  if (err) return handleError(err);
  // athletes contains an ordered list of 5 athletes who play Tennis
})
```

Above we've defined the query conditions in the `find()` method. We can also do this using a `where()` function, and we can chain all the parts of our query together using the dot operator (.) rather than adding them separately. The code fragment below is the same as our query above, with an additional condition for the age.
    
```js    
Athlete.
  find().
  where('sport').equals('Tennis').
  where('age').gt(17).lt(50).  //Additional where query
  limit(5).
  sort({ age: -1 }).
  select('name age').
  exec(callback); // where callback is the name of our callback function.
```

The `find()` method gets all matching records, but often you just want to get one match. The following methods query for a single record:

There is also a `count()` method that you can use to get the number of items that match conditions. This is useful if you want to perform a count without actually fetching the records.

There is a lot more you can do with queries. 

#### Working with Related Documents — Population

You can create references from one document/model instance to another using the `ObjectId` schema field, or from one document to many using an array of `ObjectIds`. The field stores the id of the related model. If you need the actual content of the associated document, you can use the `populate()` method in a query to replace the id with the actual data.

For example, the following schema defines authors and stories. Each author can have multiple stories, which we represent as an array of `ObjectId`. Each story can have a single author. The "ref" (highlighted in bold below) tells the schema which model can be assigned to this field.
    
```js    
var mongoose = require('mongoose')
  , Schema = mongoose.Schema

var authorSchema = Schema({
  name    : String,
  stories : [{ type: Schema.Types.ObjectId, **ref**: 'Story' }]
});

var storySchema = Schema({
  author : { type: Schema.Types.ObjectId, **ref**: 'Author' },
  title    : String
});

var Story  = mongoose.model('Story', storySchema);
var Author = mongoose.model('Author', authorSchema);
```

We can save our references to the related document by assigning the `_id` value. Below we create an author, then a book, and assign the author id to our stories author field.
    
```js    
var bob = new Author({ name: 'Bob Smith' });

bob.save(function (err) {
  if (err) return handleError(err);

  //Bob now exists, so lets create a story
  var story = new Story({
    title: "Bob goes sledding",
    author: bob._id    // assign the _id from the our author Bob. This ID is created by default!
  });

  story.save(function (err) {
    if (err) return handleError(err);
    // Bob now has his story
  });
});
```

Our story document now has an author referenced by the author document's ID. In order to get the author information in our story results we use `populate()`, as shown below.
    
```js    
Story
.findOne({ title: 'Bob goes sledding' })
.populate('author') //This populates the author id with actual author information!
.exec(function (err, story) {
  if (err) return handleError(err);
  console.log('The author is %s', story.author.name);
  // prints "The author is Bob Smith"
});
```

Astute readers will have noted that we added an author to our story, but we didn't do anything to add our story to our author's `stories` array. How then can we get all stories by a particular author? One way would be to add our author to the stories array, but this would result in us having two places where the information relating authors and stories needs to be maintained.

A better way is to get the `_id` of our _author_, then use `find()` to search for this in the author field across all stories.
    
```js    
Story
.find({ author : bob._id })
.exec(function (err, stories) {
  if (err) return handleError(err);
  // returns all stories that have Bob's id as their author.
});
```    

This is almost everything you need to know about working with related items_ for this tutorial_. 

### One Schema/Model per File

While you can create schemas and models using any file structure you like, we highly recommend defining each model schema in its own module (file), exporting the method to create the model. This is shown below:
    
```js    
// File: ./models/somemodel.js

//Require Mongoose
var mongoose = require('mongoose');

//Define a schema
var Schema = mongoose.Schema;

var SomeModelSchema = new Schema({
    a_string          : String,
    a_date            : Date,
});

**//Export function to create "SomeModel" model class
module.exports = mongoose.model('SomeModel', SomeModelSchema );**
```

You can then require and use the model immediately in other files. Below we show how you might use it to get all instances of the model.
    
```js    
//Create a SomeModel model just by requiring the module
var SomeModel = require('../models/somemodel')

// Use the SomeModel object (model) to find all SomeModel records
SomeModel.find(callback_function);
```

## Setting up the MongoDB Database

Now that we understand something of what Mongoose can do and how we want to design our models, it's time to start work on the _LocalLibrary_ website. The very first thing we want to do is set up a MongoDb database that we can use to store our library data.

For this tutorial we're going to use mLab's free cloud-hosted "sandbox" database. This database tier is not considered suitable for production websites because it has no redundancy, but it is great for development and prototyping. We're using it here because it is free and easy to set up, and because mLab is a popular _database as a service_ vendor that you might reasonably choose for your production database (other popular choices at the time of writing include Compose, ScaleGrid and MongoDB Atlas).

If you prefer you can set up a MongoDb database locally by downloading and installing the appropriate binaries for your system. The rest of the instructions in this article would be similar, except for the database URL you would specify when connecting.

You will first need to create an account with mLab (this is free, and just requires that you enter basic contact details and acknowledge their terms of service). 

After logging in, you'll be taken to the home screen:

1. Click **Create New** in the _MongoDB Deployments_ section.
2. This will open the _Cloud Provider Selection _screen.  

>DEV: Add image below
  
    * Select the SANDBOX (Free) plan from the Plan Type section. 
    * Select any provider from the _Cloud Provider _section. Different providers offer different regions (displayed below the selected plan type).
    * Click the **Continue** button.
3. This will open the _Select Region_ screen. 

>DEV: Add image below

4. This will open the _Final Details_ screen.  

>DEV: Add image below

5. This will open the _Order Confirmation_ screen.  

>DEV: Add image below

6. You will be returned to the home screen. Click on the new database you just created to open its details screen. As you can see the database has no collections (data).  

>DEV: Add image below
   
The URL that you need to use to access your database is displayed on the form above (shown for this database circled above). In order to use this you need to create a database user that you can specify in the URL.

7. Click the **Users** tab and select the **Add database user** button.
8. Enter a username and password (twice), and then press **Create**. Do not select _Make read only_.  

>DEV: Add image below

You now have now created the database, and have an URL (with username and password) that can be used to access it. This will look something like: `mongodb://your_user_namer:your_password@ds119748.mlab.com:19748/local_library`.

## Install Mongoose

Open a command prompt and navigate to the directory where you created your skeleton Local Library website. Enter the following command to install Mongoose (and its dependencies) and add it to your **Package.json** file, unless you have already done so when reading the Mongoose Primer above.
    
```js    
npm install mongoose --save
```    

## Connect to MongoDB

Open **/App.js** (in the root of your project) and copy the following text below where you declare the _Express application object_ (after the line `var app = express();`). Replace the database url string ('_insert_your_database_url_here_') with the location URL representing your own database (i.e. using the information from from mLab).
    
```js    
//Set up mongoose connection
var mongoose = require('mongoose');
var mongoDB = '_insert_your_database_url_here_';
mongoose.connect(mongoDB);
mongoose.Promise = global.Promise;
var db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));
```

As discussed in the Mongoose primer above, this code creates the default connection to the database and binds to the error event (so that errors will be printed to the console). 

## Defining the LocalLibrary Schema

We will define a separate module for each model, as discussed above. Start by creating a folder for our models in the project root (**/models**) and then create separate files for each of the models:
    
```js    
/express-locallibrary-tutorial  //the project root
  **/models**
    **author.js**
    **book.js**
    **bookinstance.js**
    **genre.js**
```    

### Author Model

Copy the `Author` schema code shown below and paste it into your **./models/Author.js** file. The scheme defines an author has having `String` SchemaTypes for the first and family names, that are required and have a maximum of 100 characters, and `Date` fields for the date of birth and death.
    
 ```js   
var mongoose = require('mongoose');

var Schema = mongoose.Schema;

var AuthorSchema = new Schema(
  {
    first_name: {type: String, required: true, max: 100},
    family_name: {type: String, required: true, max: 100},
    date_of_birth: {type: Date},
    date_of_death: {type: Date},
  }
);

**// Virtual for author's full name
AuthorSchema
.virtual('name')
.get(function () {
  return this.family_name + ', ' + this.first_name;
});**

// Virtual for author's URL
AuthorSchema
.virtual('url')
.get(function () {
  return '/catalog/author/' + this._id;
});

//Export model
module.exports = mongoose.model('Author', AuthorSchema);
```    
    

We've also declared a virtual for the AuthorSchema named "url" that returns the absolute URL required to get a particular instance of the model — we'll use the property in our templates whenever we need to get a link to a particular author.

Declaring our URLs as a virtual in the schema is a good idea because then the URL for an item only ever needs to be changed in one place.  
At this point a link using this URL wouldn't work, because we haven't got any routes handling code for individual model instances. We'll set those up in a later article!

At the end of the module we export the model.

### Book Model

Copy the `Book` schema code shown below and paste it into your **./models/Book.js** file. Most of this is similar to the author model — we've declared a schema with a number of string fields and a virtual for getting the URL of specific book records, and we've exported the model.
    
```js    
var mongoose = require('mongoose');

var Schema = mongoose.Schema;

var BookSchema = new Schema(
  {
    title: {type: String, required: true},
  **  author: {type: Schema.ObjectId, ref: 'Author', required: true},**
    summary: {type: String, required: true},
    isbn: {type: String, required: true},
  **  genre: [{type: Schema.ObjectId, ref: 'Genre'}]**
  }
);

// Virtual for book's URL
BookSchema
.virtual('url')
.get(function () {
  return '/catalog/book/' + this._id;
});

//Export model
module.exports = mongoose.model('Book', BookSchema);
```    

The main difference here is that we've created two references to other models:

* author is a reference to a single `Author` model object, and is required.
* genre is a reference to an array of `Genre` model objects. We haven't declared this object yet!

### BookInstance Model

Finally, copy the `BookInstance` schema code shown below and paste it into your **./models/Bookinstance.js** file. The `BookInstance` represents a specific copy of a book that someone might borrow, and includes information about whether the copy is available or on what date it is expected back, "imprint" or version details.
    
```js    
var mongoose = require('mongoose');

var Schema = mongoose.Schema;

var BookInstanceSchema = new Schema(
  {
    book: { type: Schema.ObjectId, ref: 'Book', required: true }, //reference to the associated book
    imprint: {type: String, required: true},
    status: {type: String, required: true, **enum: ['Available', 'Maintenance', 'Loaned', 'Reserved']**, **default: 'Maintenance'**},
    due_back: {type: Date, **default: Date.now**}
  }
);

// Virtual for bookinstance's URL
BookInstanceSchema
.virtual('url')
.get(function () {
  return '/catalog/bookinstance/' + this._id;
});

//Export model
module.exports = mongoose.model('BookInstance', BookInstanceSchema);
```

The new things we show here are the field options:

* `enum`: This allows us to set the allowed values of a string. In this case we use it to specify the availability status of our books (using an enum means that we can prevent mis-spellings and arbitrary values for our status)
* `default`: We use default to set the default status for newly created bookinstances to maintenance and the default `due_back` date to `now` (note how you can call the Date function when setting the date!)

Everything else should be familiar from our previous schema.

### Genre Model - Challenge!

Open your **./models/genre.js** file and create a schema for storing genres (the category of book, e.g. whether it is fiction or non-fiction, romance or military history, etc).

The definition will be very similar to the other models:

* The model should have a `String` SchemaType called `name` to describe the genre.
* This name should be required and have between 3 and 100 characters.
* Declare a virtual for the genre's URL, named `url`.
* Export the model.

## Testing — create some items

That's it. We now have all models for the site set up!

In order to test the models (and to create some example books and other items that we can use in our next articles) we'll now run an _independent_ script to create items of each type:

1. Download (or otherwise create) the file populatedb.js inside your _express-locallibrary-tutorial_ directory (in the same level as `package.json`). 

You don't need to know how populatedb.js works; it just adds sample data into the database.

2. Enter the following commands in the project root to install the _async_ module that is required by the script (we'll discuss this in later tutorials, ) 

```js
npm install async --save
```

3. Run the script using node in your command prompt, passing in the URL of your _MongoDB_ database (the same one you replaced the _insert_your_database_url_here _placeholder with, inside `app.js` earlier): 

```js
node populatedb 
```

4. The script should run through to completion, displaying items as it creates them in the terminal.

Go to your database on mLab. You should now be able to drill down into individual collections of Books, Authors, Genres and BookInstances, and check out individual documents.

## Summary

In this article we've learned a bit about databases and ORMs on Node/Express, and a lot about how Mongoose schema and models are defined. We then used this information to design and implement `Book`, `BookInstance`, `Author` and `Genre` models for the _LocalLibrary_ website.

Last of all we tested our models by creating a number of instances (using a standalone script). In the next article we'll look at creating some pages to display these objects.

  
