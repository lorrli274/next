The method [**async.series**](http://caolan.github.io/async/docs.html#series) is used to run multiple asynchronous operations in sequence, when subsequent functions do not depend on the output of earlier functions. It is essentially declared and behaves in the same way as `async.parallel()`.
    
```js    
async.series({ 
  one: function(callback) { ... },
  two: function(callback) { ... },
  ...
  something_else: function(callback) { ... }
  }, 

  function(err, results) {

  }
);
```

info> The ECMAScript (JavaScript) language specification states that the order of enumeration of an object is undefined, so it is possible that the functions will not be called in the same order as you specify them on all platforms. If the order really is important, then you should pass an array instead of an object, as shown below.
    
```js    
async.series([
  function(callback) {

    callback(null, 'one'); 
  },
  function(callback) {

    callback(null, 'two'); 
  } 
 ], 

  function(err, results) {

  }
);
```
