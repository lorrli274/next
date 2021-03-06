The *Package.json* file defines the application dependencies and other information:
    
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

The dependencies include the express package and the package for our selected view engine (pug). In addition, we have the following packages that are useful in many web applications:

* [body-parser](https://www.npmjs.com/package/body-parser): This parses the body portion of an incoming HTTP request and makes it easier to extract different parts of the contained information. For example, you can use this to read `POST` parameters.
* [cookie-parser](https://www.npmjs.com/package/cookie-parser): Used to parse the cookie header and populate `req.cookies` (essentially provides a convenient method for accessing cookie information).
* [debug](https://www.npmjs.com/package/debug): A tiny node debugging utility modelled after node core's debugging technique.
* [morgan](https://www.npmjs.com/package/morgan): An HTTP request logger middleware for node.
* [serve-favicon](https://www.npmjs.com/package/serve-favicon): Node middleware for serving a favicon (this is the icon used to represent the site inside the browser tab, bookmarks, etc.).

The scripts section defines a "star" script, which is what we are invoking when we call `npm start` to start the server. From the script definition you can see that this actually starts the JavaScript file *./bin/www* with node. It also defines a "devstart" script, which we invoke when calling `npm run devstart` instead. This starts the same *./bin/www* file, but with nodemon rather than node.
    
```js    
"scripts": {
"start": "node ./bin/www",
"devstart": "nodemon ./bin/www"
},
```    
