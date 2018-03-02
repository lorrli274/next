The **Package.json** file defines the application dependencies and other information:
    
```js    
{
  "name": "express-locallibrary-tutorial",
  "version": "0.0.0",
  "private": true,
  "scripts": {
    "start": "node ./bin/www",
    "devstart": "nodemon ./bin/www"
  },
  "dependencies": {
    "body-parser": "~1.18.2",
    "cookie-parser": "~1.4.3",
    "debug": "~2.6.9",
    "express": "~4.16.2",
    "morgan": "~1.9.0",
    "pug": "~2.0.0-rc.4",
    "serve-favicon": "~2.4.5"
  },
  "devDependencies": {
    "nodemon": "^1.14.11"
  }
}
```    

The dependencies include the _express_ package and the package for our selected view engine (_pug_). In addition, we have the following packages that are useful in many web applications:

* body-parser: This parses the body portion of an incoming HTTP request and makes it easier to extract different parts of the contained information. For example, you can use this to read `POST` parameters.
* cookie-parser: Used to parse the cookie header and populate `req.cookies` (essentially provides a convenient method for accessing cookie information).
* debug: A tiny node debugging utility modelled after node core's debugging technique.
* morgan: An HTTP request logger middleware for node.
* serve-favicon: Node middleware for serving a favicon (this is the icon used to represent the site inside the browser tab, bookmarks, etc.).

The scripts section defines a "_start_" script, which is what we are invoking when we call `npm start` to start the server. From the script definition you can see that this actually starts the JavaScript file **./bin/www** with _node_. It also defines a "_devstart_" script, which we invoke when calling `npm run devstart` instead. This starts the same **./bin/www** file, but with _nodemon_ rather than _node_.
    
```js    
"scripts": {
"start": "node ./bin/www",
"devstart": "nodemon ./bin/www"
},
```    
