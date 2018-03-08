The book list **controller** function needs to get a list of all `Book` objects in the database, and then pass these to the template for rendering.

Open */controllers/bookController.js*. Find the exported `book_list()` controller method and replace it with the following code.
    
```js    
exports.book_list = function(req, res, next) {

  Book.find({}, 'title author')
    .populate('author')
    .exec(function (err, list_books) {
      if (err) { return next(err); }

      res.render('book_list', { title: 'Book List', book_list: list_books });
    });

};
```

The method uses the model's `find()` function to return all `Book` objects, selecting to return the only the `title` and `author` as we don't need the other fields (it will also return the `_id` and virtual fields). Here we also call `populate()` on `Book`, specifying the `author` field—this will replace the stored book author id with the full author details.

On success, the callback passed to the query renders the *book_list*(.pug) template, passing the `title` and `book_list` (list of books with authors) as variables.
