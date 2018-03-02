The author list controller function needs to get a list of all `Author` instances, and then pass these to the template for rendering.

Open **/controllers/authorController.js**. Find the exported `author_list()` controller method near the top of the file and replace it with the following code (the changed code is shown in bold).
    
    
    exports.author_list = function(req, res, next) {
    
      Author.find()
        .sort([['family_name', 'ascending']])
        .exec(function (err, list_authors) {
          if (err) { return next(err); }
          
          res.render('author_list', { title: 'Author List', author_list: list_authors });
        });
    
    };

The method uses the model's `find()`, `sort()` and `exec()` functions to return all `Author` objects sorted by `family_name` in alphabetic order. The callback passed to the `exec()` method is called with any errors (or `null`) as the first parameter, or a list of all authors on success. If there is an error it calls the next middleware function with the error value, and if not it renders the **author_list**(.pug) template, passing the page `title` and the list of authors (`author_list`).
