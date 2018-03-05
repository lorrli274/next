The route file **/routes/users.js** is shown below (route files share a similar structure, so we don't need to also show **Index.js**). First it loads the _express_ module, and uses it to get an `express.Router` object. Then it specifies a route on that object, and lastly exports the router from the module (this is what allows the file to be imported into **App.js**).
    
```js    
var express = require('express');
var router = express.Router();

/* GET users listing. */
**router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});**

module.exports = router;
```    

The route defines a callback that will be invoked whenever an HTTP `GET` request with the correct pattern is detected. The matching pattern is the route specified when the module is imported ('`/users`') plus whatever is defined in this file ('`/`'). In other words, this route will be used when an URL of `/users/` is received.

Try this out by running the server with node and visiting the URL in your browser: . You should see a message: 'respond with a resource'.

One thing of interest above is that the callback function has the third argument '`next`', and is hence a middleware function rather than a simple route callback. While the code doesn't currently use the `next` argument, it may be useful in the future if you want to add multiple route handlers to the `'/'` route path.
