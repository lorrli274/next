Find the exported `bookinstance_create_post()` controller method and replace it with the following code.
    
    
    exports.bookinstance_create_post = [
    
        
        body('book', 'Book must be specified').isLength({ min: 1 }).trim(),
        body('imprint', 'Imprint must be specified').isLength({ min: 1 }).trim(),
        body('due_back', 'Invalid date').optional({ checkFalsy: true }).isISO8601(),
        
        
        sanitizeBody('book').trim().escape(),
        sanitizeBody('imprint').trim().escape(),
        sanitizeBody('status').trim().escape(),
        sanitizeBody('due_back').toDate(),
        
        
        (req, res, next) => {
    
            
            const errors = validationResult(req);
    
            
            var bookinstance = new BookInstance(
              { book: req.body.book,
                imprint: req.body.imprint,
                status: req.body.status,
                due_back: req.body.due_back
               });
    
            if (!errors.isEmpty()) {
                
                Book.find({},'title')
                    .exec(function (err, books) {
                        if (err) { return next(err); }
                        
                        res.render('bookinstance_form', { title: 'Create BookInstance', book_list : books, selected_book : bookinstance.book._id , errors: errors.array(), bookinstance:bookinstance });
                });
                return;
            }
            else {
                
                bookinstance.save(function (err) {
                    if (err) { return next(err); }
                       
                       res.redirect(bookinstance.url);
                    });
            }
        }
    ];

The structure and behaviour of this code is the same as for creating our other objects. First we validate and sanitize the data. If the data is invalid, we then re-display the form along with the data that was originally entered by the user and a list of error messages. If the data is valid, we save the new `BookInstance` record and redirect the user to the detail page.
