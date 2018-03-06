Find the exported `author_delete_post()` controller method, and replace it with the following code.
    
    
    exports.author_delete_post = function(req, res, next) {
    
        async.parallel({
            author: function(callback) {
              Author.findById(req.body.authorid).exec(callback)
            },
            authors_books: function(callback) {
              Book.find({ 'author': req.body.authorid }).exec(callback)
            },
        }, function(err, results) {
            if (err) { return next(err); }
            
            if (results.authors_books.length > 0) {
                
                res.render('author_delete', { title: 'Delete Author', author: results.author, author_books: results.authors_books } );
                return;
            }
            else {
                
                Author.findByIdAndRemove(req.body.authorid, function deleteAuthor(err) {
                    if (err) { return next(err); }
                    
                    res.redirect('/catalog/authors')
                })
            }
        });
    };

First we validate that an id has been provided (this is sent via the form body parameters, rather than using the version in the URL). Then we get the author and their associated books in the same way as for the `GET` route. If there are no books then we delete the author object and redirect to the list of all authors. If there are still books then we just re-render the form, passing in the author and list of books to be deleted.

**Note:** We could check if the call to `findById()`** **returns any result, and if not,  immediately render the list of all authors.  We've left the code as it is above for brevity (it will still return the list of authors if the id is not found, but this will happen after `findByIdAndRemove()`).
