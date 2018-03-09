Open */controllers/bookController.js*. Find the exported `book_update_get()` **controller** method and replace it with the following code.
    
```    
exports.book_update_get = function(req, res, next) {


    async.parallel({
        book: function(callback) {
            Book.findById(req.params.id).populate('author').populate('genre').exec(callback);
        },
        authors: function(callback) {
            Author.find(callback);
        },
        genres: function(callback) {
            Genre.find(callback);
        },
        }, function(err, results) {
            if (err) { return next(err); }
            if (results.book==null) { 
                var err = new Error('Book not found');
                err.status = 404;
                return next(err);
            }


            for (var all_g_iter = 0; all_g_iter < results.genres.length; all_g_iter++) {
                for (var book_g_iter = 0; book_g_iter < results.book.genre.length; book_g_iter++) {
                    if (results.genres[all_g_iter]._id.toString()==results.book.genre[book_g_iter]._id.toString()) {
                        results.genres[all_g_iter].checked='true';
                    }
                }
            }
            res.render('book_form', { title: 'Update Book', authors:results.authors, genres:results.genres, book: results.book });
        });

};
```

The controller gets the id of the `Book` to be updated from the URL parameter (`req.params.id`). It uses the `async.parallel()` method to get the specified `Book` record (populating its genre and author fields) and lists of all the `Author` and `Genre` objects. When all operations have completed it marks the currently selected genres as checked and then renders the** book_form.pug** view, passing variables for `title`, book, all `authors`, and all `genres`.
