The code below provides a concrete example of how we can create a route module and then use it in an _Express_ application.

First we create routes for a wiki in a module named **Wiki.js**. The code first imports the Express application object, uses it to get a `Router` object and then adds a couple of routes to it using the `get()` method. Last of all the module exports the `Router` object.

```js
// wiki.js - Wiki route module.

var express = require('express');
var router = express.Router();

// Home page route.
router.get('/', function (req, res) {
	res.send('Wiki home page');
})

// About page route.
router.get('/about', function (req, res) {
	res.send('About this wiki');
})

module.exports = router;
```

Above we are defining our route handler callbacks directly in the router functions. In the LocalLibrary we'll define these callbacks in a separate controller module.

To use the router module in our main app file we first `require()` the route module (**Wiki.js**). We then call `use()` on the _Express_ application to add the Router to the middleware handling path, specifying an URL path of 'wiki'.

```js
var wiki = require('./wiki.js');
// ...
app.use('/wiki', wiki);
```

The two routes defined in our wiki route module are then accessible from `/wiki/` and `/wiki/about/`.
