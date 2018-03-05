The file **/bin/www** is the application entry point! The very first thing this does is `require()` the "real" application entry point (**App.js**, in the project root) that sets up and returns the `express()` application object.
    
```js    
#!/usr/bin/env node

/**
 * Module dependencies.
 */

**var app = require('../app');**
```    

 `require()` is a global node function that is used to import modules into the current file. Here we specify **App.js** module using a relative path and omitting the optional (.**js**) file extension.

The remainder of the code in this file sets up a node HTTP server with `app` set to a specific port (defined in an environment variable or 3000 if the variable isn't defined), and starts listening and reporting server errors and connections. For now you don't really need to know anything else about the code (everything in this file is "boilerplate"), but feel free to review it if you're interested.
