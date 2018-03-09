Find the exported `book_create_get()` **controller** method and replace it with the following code.
    
```js
exports.book_create_get = function(req, res, next) { 


    async.parallel({
        authors: function(callback) {
            Author.find(callback);
        },
        genres: function(callback) {
            Genre.find(callback);
        },
    }, function(err, results) {
        if (err) { return next(err); }
        res.render('book_form', { title: 'Create Book', authors: results.authors, genres: results.genres });
    });

};
```

This uses the async module to get all `Author` and `Genre` objects. These are then passed to the view `**book_form.pug**` as variables named `authors` and `genres` (along with the page `title`).
