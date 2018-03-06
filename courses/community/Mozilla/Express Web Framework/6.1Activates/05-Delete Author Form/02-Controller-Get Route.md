Open **/controllers/authorController.js**. Find the exported `author_delete_get()` controller method and replace it with the following code.
    
    
    exports.author_delete_get = function(req, res, next) {
    
        async.parallel({
            author: function(callback) {
                Author.findById(req.params.id).exec(callback)
            },
            authors_books: function(callback) {
              Book.find({ 'author': req.params.id }).exec(callback)
            },
        }, function(err, results) {
            if (err) { return next(err); }
            if (results.author==null) { 
                res.redirect('/catalog/authors');
            }
            
            res.render('author_delete', { title: 'Delete Author', author: results.author, author_books: results.authors_books } );
        });
    
    };

The controller gets the id of the `Author` instance to be deleted from the URL parameter (`req.params.id`). It uses the `async.parallel()` method to get the author record and all associated books in parallel. When both operations have completed it renders the `**author_delete**`**.pug** view, passing variables for the `title`, `author`, and `author_books`.

**Note:** If  `findById()`** **returns no results the author is not in the database. In this case there is nothing to delete, so we immediately render the list of all authors. 
    
    
    }, function(err, results) {
        if (err) { return next(err); }
        if (results.author==null) { 
            res.redirect('/catalog/authors')
        }
