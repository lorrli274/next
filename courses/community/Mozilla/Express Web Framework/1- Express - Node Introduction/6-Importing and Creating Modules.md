A **module** is a JavaScript library/file that you can import into other code using Node's `require()` function. Express itself is a module, as are the middleware and database libraries that we use in our Express applications.

The code below shows how we import a module by name, using the Express framework as an example. First we invoke the `require()` function, specifying the name of the module as a string (`'express'`), and calling the returned object to create an Express application. We can then access the properties and functions of the application object.
    
```js    
var express = require('express');
var app = express();
```

You can also create your own modules that can be imported in the same way.

info> You will want to create your own modules, because this allows you to organise your code into managable parts — a monolithic single-file application is hard to understand and maintain. Using modules also helps you manage your namespace, because only the variables you explicitly export are imported when you use a module.

To make objects available outside of a module you just need to assign them to the `exports` object. For example, the **Square.js** module below is a file that exports `area()` and `perimeter()` methods:
    
```js    
exports.area = function(width) { return width * width; };
exports.perimeter = function(width) { return 4 * width; };
```

We can import this module using `require()`, and then call the exported method(s) as shown:
    
```js    
var square = require('./square'); // Here we require() the name of the file without the (optional) .js file extension
console.log('The area of a square with a width of 4 is ' + square.area(4));
```

info> You can also specify an absolute path to the module (or a name, as we did initially).

If you want to export a complete object in one assignment instead of building it one property at a time, assign it to `module.exports` as shown below (you can also do this to make the root of the exports object a constructor or other function):
    
```js    
module.exports = {
	area: function(width) {
		return width * width;
	},

	perimeter: function(width) {
		return 4 * width;
	}
};
```
