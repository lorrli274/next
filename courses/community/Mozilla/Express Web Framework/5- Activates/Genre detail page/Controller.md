Open **/controllers/genreController.js** and import the _async_ and _Book_ modules at the top of the file.
    
    
    var Book = require('../models/book');
    var async = require('async');
    

Find the exported `genre_detail``()` controller method and replace it with the following code.
    
    
    // Display detail page for a specific Genre.
    exports.genre_detail = function(req, res, next) {
    
    **    async.parallel({
            genre: function(callback) {
                Genre.findById(req.params.id)
                  .exec(callback);
            },
    
            genre_books: function(callback) {
              Book.find({ 'genre': req.params.id })
              .exec(callback);
            },
    
        }, function(err, results) {
            if (err) { return next(err); }
            if (results.genre==null) { // No results.
                var err = new Error('Genre not found');
                err.status = 404;
                return next(err);
            }
            // Successful, so render
            res.render('genre_detail', { title: 'Genre Detail', genre: results.genre, genre_books: results.genre_books } );
        });**
    
    };
    

The method uses `async.parallel()` to query the genre name and its associated books in parallel, with the callback rendering the page when (if) both requests complete successfully.

The ID of the required genre record is encoded at the end of the URL and extracted automatically based on the route definition (**/genre/:id**). The ID is accessed within the controller via the request parameters: `req.params.id`. It is used in `Genre.findById()` to get the current genre. It is also used to get all `Book` objects that have the genre ID in their `genre` field: `Book.find({ 'genre': req.params.id })`.

**Note:** If the genre does not existing the database (i.e. it may have been deleted) then `findById()`  will return successfully with no results. In this case we want to display a "not found" page, so we create an `Error` object and pass it to the `next` middleware function in the chain. This message will then propagate through to our error handling code.
    
    
    **if (results.genre==null) { // No results.
        var err = new Error('Genre not found');
        err.status = 404;
        return next(err);
    }**
    

The message will then propagate through to our error handling code (this was set up when we [generated the app skeleton][1] - for more information see [Handling Errors][2]).

The rendered view is **genre_detail** and it is passed variables for the `title`, `genre` and the list of books in this genre (`genre_books`).
