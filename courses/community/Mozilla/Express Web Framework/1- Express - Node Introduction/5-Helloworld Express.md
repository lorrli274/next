First lets consider the standard Express Hello World example (we discuss each part of this below, and in the following sections).

 If you have Node and Express already installed (or if you install them as shown in the next article), you can save this code in a file called **App.js** and run it in a command prompt by calling `node app.js`.
    
```js    
var express = require('express');
var app = express();

**app.get('/', function(req, res) {
	res.send('Hello World!');
});**

app.listen(3000, function() {
	console.log('Example app listening on port 3000!');
});
```

The first two lines `require()` (import) the express module and create an Express application. This object, which is traditionally named `app`, has methods for routing HTTP requests, configuring middleware, rendering HTML views, registering a template engine, and modifying application settings that control how the application behaves (e.g. the environment mode, whether route definitions are case sensitive, etc.)

The middle part of the code (the three lines starting with `app.get` shows a _route definition_. The `app.get()` method specifies a callback function that will be invoked whenever there is an HTTP `GET` request with a path (`'/'`) relative to the site root. The callback function takes a request and a response object as arguments, and simply calls `send()` on the response to return the string "Hello World!"

The final block starts up the server on port '3000' and prints a log comment to the console. With the server running, you could go to `localhost:3000` in your browser to see the example response returned.
