**Route parameters** are named URL segments used to capture the values specified at their position in the URL. The named segments are prefixed with a colon and then the name (e.g. `/**:**your_parameter_name/`. The captured values are stored in the `req.params` object using the parameter names as keys (e.g. `req.params.your_parameter_name`).

So for example, consider a URL encoded to contain information about users and books: `http://localhost:5000/users/34/books/8989`. We can extract this information as shown below, with the `userId` and `bookId` path parameters:
    
```js    
app.get('/users/:userId/books/:bookId', function (req, res) {
	// Access userId via: req.params.userId
	// Access bookId via: req.params.bookId
	res.send(req.params);
})
```

The names of route parameters must be made up of "word characters" (A-Z, a-z, 0-9, and _).

info> The URL /book/create will be matched by a route like `/book/:bookId` (which will extract a "bookId" value of '`create`'). The first route that matches an incoming URL will be used, so if you want to process `/book/create` URLs separately, their route handler must be defined before your `/book/:bookId` route.

That's all you need to get started with routes. The following steps show how we'll set up our routes and controllers for the LocalLibrary.
