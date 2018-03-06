**Middleware** is used extensively in Express apps, for tasks from serving static files to error handling, to compressing HTTP responses. Whereas route functions end the HTTP request-response cycle by returning some response to the HTTP client, middleware functions typically perform some operation on the request or response and then call the next function in the "stack", which might be more middleware or a route handler. The order that middleware is called is up to the app developer.

info> The middleware can perform any operation, execute any code, make changes to the request and response object, and it can_ also end the request-response cycle. If it does not end the cycle then it must call `next()` to pass control to the next middleware function (or the request will be left hanging).

Most apps will use third-party middleware in order to simplify common web development tasks like working with cookies, sessions, user authentication, accessing request `POST` and JSON data, logging, etc. You can find a [list](http://expressjs.com/en/resources/middleware.html) of middleware packages maintained by the Express team (which also includes other popular 3rd party packages). Other Express packages are available on the NPM package manager.

To use third party middleware you first need to install it into your app using NPM. For example, to install the [morgan](http://expressjs.com/en/resources/middleware/morgan.html) HTTP request logger middleware, you'd do this:
    
```js    
$ npm install morgan
```    

You could then call `use()` on the Express application object to add the middleware to the stack:
    
```js    
var express = require('express');
**var logger = require('morgan');**
var app = express();
**app.use(logger('dev'));**
...
```

Middleware and routing functions are called in the order that they are declared. For some middleware the order is important (for example if session middleware depends on cookie middleware, then the cookie handler must be added first). It is almost always the case that middleware is called before setting routes, or your route handlers will not have access to functionality added by your middleware.

You can write your own middleware functions, and you are likely to have to do so (if only to create error handling code). The only difference between a middleware function and a route handler callback is that middleware functions have a third argument `next`, which middleware functions are expected to call if they do not complete the request cycle (when the middleware function is called, this contains the next function that must be called).

You can add a middleware function to the processing chain with either `app.use()` or `app.add()`, depending on whether you want to apply the middleware to all responses or to responses with a particular HTTP verb (`GET`, `POST`, etc). You specify routes the same in both cases, though the route is optional when calling **app.use()**.

The example below shows how you can add the middleware function using both methods, and with/without a route.
    
```js    
var express = require('express');
var app = express();

// An example middleware function
var a_middleware_function = function(req, res, _next_) {
	// ... perform some operations
	next(); // Call next() so Express will call the next middleware function in the chain.
}

// Function added with use() for all routes and verbs
app.use(a_middleware_function);

// Function added with use() for a specific route
app.use('/someroute', a_middleware_function);

// A middleware function added for a specific HTTP verb and route
app.get('/', a_middleware_function);

app.listen(3000);
```

Above we declare the middleware function separately and then set it as the callback. In our previous route handler function we declared the callback function when it was used. In JavaScript, either approach is valid.
