Find the exported `book_update_post()` controller method, and replace it with the following code.
    
    
    exports.book_update_post = [
    
        
        (req, res, next) => {
            if(!(req.body.genre instanceof Array)){
                if(typeof req.body.genre==='undefined')
                req.body.genre=[];
                else
                req.body.genre=new Array(req.body.genre);
            }
            next();
        },
       
        
        body('title', 'Title must not be empty.').isLength({ min: 1 }).trim(),
        body('author', 'Author must not be empty.').isLength({ min: 1 }).trim(),
        body('summary', 'Summary must not be empty.').isLength({ min: 1 }).trim(),
        body('isbn', 'ISBN must not be empty').isLength({ min: 1 }).trim(),
    
        
        sanitizeBody('title').trim().escape(),
        sanitizeBody('author').trim().escape(),
        sanitizeBody('summary').trim().escape(),
        sanitizeBody('isbn').trim().escape(),
        sanitizeBody('genre.*').trim().escape(),
    
        
        (req, res, next) => {
    
            
            const errors = validationResult(req);
    
            
            var book = new Book(
              { title: req.body.title,
                author: req.body.author,
                summary: req.body.summary,
                isbn: req.body.isbn,
                genre: (typeof req.body.genre==='undefined') ? [] : req.body.genre,
                _id:req.params.id 
               });
    
            if (!errors.isEmpty()) {
                
    
                
                async.parallel({
                    authors: function(callback) {
                        Author.find(callback);
                    },
                    genres: function(callback) {
                        Genre.find(callback);
                    },
                }, function(err, results) {
                    if (err) { return next(err); }
    
                    
                    for (let i = 0; i < results.genres.length; i++) {
                        if (book.genre.indexOf(results.genres[i]._id) > -1) {
                            results.genres[i].checked='true';
                        }
                    }
                    res.render('book_form', { title: 'Update Book',authors:results.authors, genres:results.genres, book: book, errors: errors.array() });
                });
                return;
            }
            else {
                
                Book.findByIdAndUpdate(req.params.id, book, {}, function (err,thebook) {
                    if (err) { return next(err); }
                       
                       res.redirect(thebook.url);
                    });
            }
        }
    ];

This is very similar to the post route used when creating a Book. First we validate and sanitize the book data from the form and use it to create a new `Book` object (setting its `_id` value to the id of the object to update). If there are errors when we validate the data then we re-render the form, additionally displaying the data entered by the user, the errors, and lists of genres and authors. If there are no errors then we call `Book.findByIdAndUpdate()` to update the `Book` document, and then redirect to its detail page.
