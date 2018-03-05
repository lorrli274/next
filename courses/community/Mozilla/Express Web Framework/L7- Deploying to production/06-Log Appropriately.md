Logging calls can have an impact on a high-traffic website. In a production environment you may need to log website activity (e.g. tracking traffic or logging API calls) but you should attempt to minimise the amount of logging added for debugging purposes.

One way to minimise "debug" logging in production is to use a module like debug that allows you to control what logging is performed by setting an environment variable. For example, the code fragment below shows how you might  set up "author" logging. The debug variable is declared with the name 'author', and the prefix "author" will be automatically displayed for all logs from this object.
    
```js    
var debug = require('debug')('author');

// Display Author update form on GET
exports.author_update_get = function(req, res, next) {   

    req.sanitize('id').escape().trim();
    Author.findById(req.params.id, function(err, author) {
        if (err) {
            debug('update error:' + err);
            return next(err);
        }
        //On success
        res.render('author_form', { title: 'Update Author', author: author });
    });

};
```

You can then enable a particular set of logs by specifying them as a comma-separated list in the `DEBUG` environment variable. You can set the variables for displaying author and book logs as shown (wildcards are also supported).
    
```    
#Windows
set DEBUG=author,book

#Linux
export DEBUG="author,book" 
```    

Calls to `debug` can replace logging you might previously have done using `console.log()` or `console.error()`. Replace any `console.log()` calls in your code with logging via the debug module. Turn the logging on and off in your development environment by setting the DEBUG variable and observe the impact this has on logging.

If you need to log website activity you can use a logging library like Winston or Bunyan.
