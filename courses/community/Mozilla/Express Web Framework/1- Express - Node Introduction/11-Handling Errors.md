Errors are handled by one or more special middleware functions that have four arguments, instead of the usual three: `(err, req, res, next)`. For example:
    
```js    
app.use(function(err, req, res, next) {
	console.error(err.stack);
	res.status(500).send('Something broke!');
});
```

These can return any content required, but must be called after all other `app.use()` and routes calls so that they are the last middleware in the request handling process!

Express comes with a built-in error handler, which takes care of any remaining errors that might be encountered in the app. This default error-handling middleware function is added at the end of the middleware function stack. If you pass an error to `next()` and you do not handle it in an error handler, it will be handled by the built-in error handler; the error will be written to the client with the stack trace.

The stack trace is not included in the production environment. To run it in production mode you need to set the the environment variable `NODE_ENV` to '`production'`.

HTTP404 and other "error" status codes are not treated as errors. If you want to handle these, you can add a middleware function to do so.
