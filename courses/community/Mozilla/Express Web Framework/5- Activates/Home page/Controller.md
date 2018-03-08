The index **controller** function needs to fetch information about how many `Book`, `BookInstance`, available `BookInstance`, `Author`, and `Genre` records we have in the database, render this data in a template to create an HTML page, and then return it in an HTTP response.

We use the [count](http://mongoosejs.com/docs/api.html#model_Model.count) method to get the number of instances of each model. This is called on a model with an optional set of conditions to match against in the first argument and a callback in the second argument (as discussed in [Using a Database (with Mongoose)](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/mongoose), and you can also return a `Query` and then execute it with a callback later. The callback will be returned when the database returns the count, with an error value (or `null`) as the first parameter and the count of records (or null if there was an error) as the second parameter.
    
```js    
SomeModel.count({ a_model_field: 'match_value' }, function (err, count) {
// ... do something if there is an err
// ... do something with the count if there was no error  
});
```
Open */controllers/bookController.js*. Near the top of the file you should see the exported `index()` function.
    
```js    
var Book = require('../models/book')

exports.index = function(req, res, next) {
 res.send('NOT IMPLEMENTED: Site Home Page'); 
}
```

Replace all the code above with the following code fragment. The first thing this does is import (`require()`) all the models (highlighted in bold). We need to do this because we'll be using them to get our counts of records. It then imports the async module.
    
```js
var Book = require('../models/book');
var Author = require('../models/author');
var Genre = require('../models/genre');
var BookInstance = require('../models/bookinstance');

var async = require('async');

exports.index = function(req, res) {   

    async.parallel({
        book_count: function(callback) {
            Book.count(callback);
        },
        book_instance_count: function(callback) {
            BookInstance.count(callback);
        },
        book_instance_available_count: function(callback) {
            BookInstance.count({status:'Available'}, callback);
        },
        author_count: function(callback) {
            Author.count(callback);
        },
        genre_count: function(callback) {
            Genre.count(callback);
        },
    }, function(err, results) {
        res.render('index', { title: 'Local Library Home', error: err, data: results });
    });
};
```

The `async.parallel()` method is passed an object with functions for getting the counts for each of our models. These functions are all started at the same time. When all them have completed the final callback is invoked with the counts in the results parameter (or an error).

On success the callback function calls [res.render](http://expressjs.com/en/4x/api.html#res.render), specifying a view (template) named 'index' and an object containing the data that is to be inserted into it (this includes the results object that contains our model counts). The data is supplied as key-value pairs, and can be accessed in the template using the key.

info> The callback function from `async.parallel()` above is a little unusual in that we render the page whether or not there was an error (normally you might use a separate execution path for handling the display of errors).
