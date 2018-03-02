Open **App.js** and require the catalog route below the other routes (add the third line shown below, underneath the other two):
•    
```js    
var index = require('./routes/index');
var users = require('./routes/users');
**var catalog = require('./routes/catalog');  //Import routes for "catalog" area of site**
```

Next, add the catalog route to the middleware stack below the other routes (add the third line shown below, underneath the other two):
•    
```js    
app.use('/', index);
app.use('/users', users);
**app.use('/catalog', catalog);  // Add catalog routes to middleware chain.**
```

We have added our catalog module at a path `'/catalog'`. This is prepended to all of the paths defined in the catalog module. So for example, to access a list of books, the URL will be: `/catalog/books/`.

That's it. We should now have routes and skeleton functions enabled for all the URLs that we will eventually support on the LocalLibrary website.
