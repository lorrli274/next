Find the exported `author_create_post()` controller method, and replace it with the following code.
    
```Javascript    
exports.author_create_post = [


    body('first_name').isLength({ min: 1 }).trim().withMessage('First name must be specified.')
        .isAlphanumeric().withMessage('First name has non-alphanumeric characters.'),
    body('family_name').isLength({ min: 1 }).trim().withMessage('Family name must be specified.')
        .isAlphanumeric().withMessage('Family name has non-alphanumeric characters.'),
    body('date_of_birth', 'Invalid date of birth').optional({ checkFalsy: true }).isISO8601(),
    body('date_of_death', 'Invalid date of death').optional({ checkFalsy: true }).isISO8601(),


    sanitizeBody('first_name').trim().escape(),
    sanitizeBody('family_name').trim().escape(),
    sanitizeBody('date_of_birth').toDate(),
    sanitizeBody('date_of_death').toDate(),


    (req, res, next) => {


        const errors = validationResult(req);

        if (!errors.isEmpty()) {

            res.render('author_form', { title: 'Create Author', author: req.body, errors: errors.array() });
            return;
        }
        else {



            var author = new Author(
                {
                    first_name: req.body.first_name,
                    family_name: req.body.family_name,
                    date_of_birth: req.body.date_of_birth,
                    date_of_death: req.body.date_of_death
                });
            author.save(function (err) {
                if (err) { return next(err); }

                res.redirect(author.url);
            });
        }
    }
];
```

The structure and behaviour of this code is almost exactly the same as for creating a `Genre` object. First we validate and sanitize the data. If the data is invalid then we re-display the form along with the data that was originally entered by the user and a list of error messages. If the data is valid then we save the new author record and redirect the user to the author detail page.

Unlike with the `Genre` post handler, we don't check whether the `Author` object already exists before saving it. Arguably we should, though as it is now we can have multiple authors with the same name.

The validation code demonstrates several new features:

* We can daisy chain validators, using `withMessage()` to specify the error message to display if the previous validation method fails. This makes it very easy to provide specific error messages without lots of code duplication. 

```Javascript
    // Validate fields.
body('first_name').isLength({ min: 1 }).trim().withMessage('First name must be specified.')
    .isAlphanumeric().withMessage('First name has non-alphanumeric characters.'),
```    

* We can use the `optional()` function to run a subsequent validation only if a field has been entered (this allows us to validate optional fields). For example, below we check that the optional date of birth is an ISO8601-compliant date (the `checkFalsy` flag means that we'll accept either an empty string or `null` as an empty value). 

```Javascript
body('date_of_birth', 'Invalid date of birth').optional({ checkFalsy: true }).isISO8601(),
```
