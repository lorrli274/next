Open **/controllers/bookController.js**. Find the exported `book_detail()` controller method and replace it with the following code.
    
    
    // Display detail page for a specific book.
    exports.book_detail = function(req, res, next) {
    
    **    async.parallel({
            book: function(callback) {
    
                Book.findById(req.params.id)
                  .populate('author')
                  .populate('genre')
                  .exec(callback);
            },
            book_instance: function(callback) {
    
              BookInstance.find({ 'book': req.params.id })
              .exec(callback);
            },
        }, function(err, results) {
            if (err) { return next(err); }
            if (results.book==null) { // No results.
                var err = new Error('Book not found');
                err.status = 404;
                return next(err);
            }
            // Successful, so render.
            res.render('book_detail', { title: 'Title', book:  results.book, book_instances: results.book_instance } );
        });**
    
    };
    
    

**Note:** We don't need to require _async_ and _BookInstance_, as we already imported those modules when we implemented the home page controller.

The method uses `async.parallel()` to find the `Book` and its associated copies (`BookInstances`) in parallel. The approach is exactly the same as described for the _Genre detail page_ above.
