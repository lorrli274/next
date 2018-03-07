So far in this tutorial we've used a single database that is hard coded into *App.js*. Normally we'd like to be able to have a different database for production and development, so next we'll modify the LocalLibrary website to get the database URI from the OS environment (if it has been defined), and otherwise use our development database.

Open *App.js* and find the line that sets the mongoDB connection variable. It will look something like this:
    
```js    
var mongoDB = 'mongodb://your_user_id:your_password@ds119748.mlab.com:19748/local_library';
```

Replace the line with the following code that uses `process.env.MONGODB_URI` to get the connection string from an environment variable named `MONGODB_URI` if has been set (use your own database URL instead of the placeholder below.)
    
```js    
var mongoDB = **process.env.MONGODB_URI** || 'mongodb://your_user_id:your_password@ds119748.mlab.com:19748/local_library';
```    
