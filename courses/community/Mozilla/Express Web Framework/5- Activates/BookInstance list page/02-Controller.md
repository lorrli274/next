The `BookInstance` list **controller** function needs to get a list of all book instances, populate the associated book information, and then pass the list to the template for rendering.

Open */controllers/bookinstanceController.js*. Find the exported `bookinstance_list()` controller method and replace it with the following code (the changed code is shown in bold).
    
```js    
exports.bookinstance_list = function(req, res, next) {

  BookInstance.find()
    .populate('book')
    .exec(function (err, list_bookinstances) {
      if (err) { return next(err); }

      res.render('bookinstance_list', { title: 'Book Instance List', bookinstance_list: list_bookinstances });
    });

};
```
The method uses the model's `find()` function to return all `BookInstance` objects. It then daisy-chains a call to `populate()` with the `book` field—this will replace the book id stored for each `BookInstance` with a full `Book` document.

On success, the callback passed to the query renders the *bookinstance_list*(.pug) template, passing the `title` and `bookinstance_list` as variables.
