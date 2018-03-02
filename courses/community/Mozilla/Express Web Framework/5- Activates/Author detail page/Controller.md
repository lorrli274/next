Open **/controllers/authorController.js**.

Add the following lines to the top of the file to import the _async_ and _Book_ modules (these are needed for our author detail page).
    
    
    var async = require('async');
    var Book = require('../models/book');

Find the exported `author_detail()` controller method and replace it with the following code.
    
    
    // Display detail page for a specific Author.
    exports.author_detail = function(req, res, next) {
    
    **    async.parallel({
            author: function(callback) {
                Author.findById(req.params.id)
                  .exec(callback)
            },
            authors_books: function(callback) {
              Book.find({ 'author': req.params.id },'title summary')
              .exec(callback)
            },
        }, function(err, results) {
            if (err) { return next(err); } // Error in API usage.
            if (results.author==null) { // No results.
                var err = new Error('Author not found');
                err.status = 404;
                return next(err);
            }
            // Successful, so render.
            res.render('author_detail', { title: 'Author Detail', author: results.author, author_books: results.authors_books } );
        });**
    
    };
    

The method uses `async.parallel()` to query the `Author` and their associated `Book` instances in parallel, with the callback rendering the page when (if) both requests complete successfully. The approach is exactly the same as described for the _Genre detail page_ above.
