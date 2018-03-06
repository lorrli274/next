Find the exported `book_create_post()` controller method and replace it with the following code.
    
    
    exports.book_create_post = [
        
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
      
        
        sanitizeBody('*').trim().escape(),
    
        
        (req, res, next) => {
            
            
            const errors = validationResult(req);
    
            
            var book = new Book(
              { title: req.body.title,
                author: req.body.author,
                summary: req.body.summary,
                isbn: req.body.isbn,
                genre: req.body.genre
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
                    res.render('book_form', { title: 'Create Book',authors:results.authors, genres:results.genres, book: book, errors: errors.array() });
                });
                return;
            }
            else {
                
                book.save(function (err) {
                    if (err) { return next(err); }
                       
                       res.redirect(book.url);
                    });
            }
        }
    ];

The structure and behaviour of this code is almost exactly the same as for creating a `Genre` or `Author` object. First we validate and sanitize the data. If the data is invalid then we re-display the form along with the data that was originally entered by the user and a list of error messages. If the data is valid, we then save the new `Book` record and redirect the user to the book detail page.

The first main difference with respect to the other form handling code is that we use a wildcard to trim and escape all fields in one go (rather than sanitising them individually):
    
    
    sanitizeBody('*').trim().escape(),

The next main difference with respect to the other form handling code is how we sanitize the genre information. The form returns an array of `Genre` items (while for other fields it returns a string). In order to validate the information we first convert the request to an array (required for the next step).
    
    
    (req, res, next) => {
        if(!(req.body.genre instanceof Array)){
            if(typeof req.body.genre==='undefined')
            req.body.genre=[];
            else
            req.body.genre=new Array(req.body.genre);
        }
        next();
    },

We then use a wildcard (`*`) in the sanitiser to individually validate each of the genre array entries. The code below shows how - this translates to "sanitise every item below key `genre`".
    
    
    sanitizeBody('genre.*').trim().escape(),

The final difference with respect to the other form handling code is that we need to pass in all existing genres and authors to the form. In order to mark the genres that were checked by the user we iterate through all the genres and add the `checked='true'` parameter to those that were in our post data (as reproduced in the code fragment below).
    
    
    for (let i = 0; i < results.genres.length; i++) {
        if (book.genre.indexOf(results.genres[i]._id) > -1) {
            
            results.genres[i].checked='true';
        }
    }
