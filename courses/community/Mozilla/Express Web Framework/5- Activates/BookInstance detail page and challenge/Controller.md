Open **/controllers/bookinstanceController.js**. Find the exported `bookinstance_detail()` controller method and replace it with the following code.
    
    
    // Display detail page for a specific BookInstance.
    exports.bookinstance_detail = function(req, res, next) {
    
    **    BookInstance.findById(req.params.id)
        .populate('book')
        .exec(function (err, bookinstance) {
          if (err) { return next(err); }
          if (bookinstance==null) { // No results.
              var err = new Error('Book copy not found');
              err.status = 404;
              return next(err);
            }
          // Successful, so render.
          res.render('bookinstance_detail', { title: 'Book:', bookinstance:  bookinstance});
        })**
    
    };
    

The method calls `BookInstance.findById()` with the ID of a specific book instance extracted from the URL (using the route), and accessed within the controller via the request parameters: `req.params.id`). It then calls `populate()` to get the details of the associated `Book`.
