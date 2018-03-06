At the top of the file, require the _Book_ module (needed because each `BookInstance` is associated with a particular `Book`).
    
    
    var Book = require('../models/book');

Find the exported `bookinstance_create_get()` controller method and replace it with the following code.
    
    
    exports.bookinstance_create_get = function(req, res, next) {       
    
        Book.find({},'title')
        .exec(function (err, books) {
          if (err) { return next(err); }
          
          res.render('bookinstance_form', {title: 'Create BookInstance', book_list:books});
        });
        
    };

The controller gets a list of all books (`book_list`) and passes it to the view `**bookinstance_form.pug**` (along with the `title`)
