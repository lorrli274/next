This file creates an `express` application object (named `app`, by convention), sets up the application with various settings and middleware, and then exports the app from the module. The code below shows just the parts of the file that create and export the app object:
    
```js    
var express = require('express');
var app = express();
...
module.exports = app;
 ```   

Back in the **www** entry point file above, it is this `module.exports` object that is supplied to the caller when this file is imported.

Lets work through the **App.js** file in detail. First we import some useful node libraries into the file using `require()`, including _express_, _serve-favicon_, _morgan_, _cookie-parser_ and _body-parser_ that we previously downloaded for our application using NPM; and _path_, which is a core Node library for parsing file and directory paths.
    
```js    
var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
```    

Then we `require()` modules from our routes directory. These modules/files contain code for handling particular sets of related "routes" (URL paths). When we extend the skeleton application, for example to list all books in the library, we will add a new file for dealing with book-related routes.
    
```js    
var index = require('./routes/index');
var users = require('./routes/users');
```    

At this point we have just _imported_ the module; we haven't actually used its routes yet (this happens just a little bit further down the file).

Next we create the `app` object using our imported _express_ module, and then use it to set up the view (template) engine. There are two parts to setting up the engine. First we set the '`views`' value to specify the folder where the templates will be stored (in this case the sub folder **/views**). Then we set the '`view engine`' value to specify the template library (in this case "pug").
    
```js    
var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');
```    

The next set of functions call `app.use()` to add the _middleware_ libraries into the request handling chain. In addition to the 3rd party libraries we imported previously, we use the `Express.static` middleware to get _Express_ to serve all the static files in the directory **/public** in the project root.
    
```js    
// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
**app.use(express.static(path.join(__dirname, 'public')));**
```    

Now that all the other middleware is set up, we add our (previously imported) route-handling code to the request handling chain. The imported code will define particular routes for the different _parts_ of the site:
    
```js    
app.use('/', index);
app.use('/users', users);
```    

The paths specified above ('/' and '`/users'`) are treated as a prefix to routes defined in the imported files. So for example if the imported **users** module defines a route for `/profile`, you would access that route at `/users/profile`. We'll talk more about routes in a later article.

The last middleware in the file adds handler methods for errors and HTTP 404 responses.
    
 ```js   
// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});
```    

The Express application object (app) is now fully configured. The last step is to add it to the module exports (this is what allows it to be imported by **/bin/www**).
    
```js    
module.exports = app;
```
