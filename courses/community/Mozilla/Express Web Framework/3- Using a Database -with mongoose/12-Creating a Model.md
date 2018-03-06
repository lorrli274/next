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
