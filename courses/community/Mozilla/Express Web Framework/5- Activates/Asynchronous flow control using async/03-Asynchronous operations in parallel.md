The method [**async.parallel**](http://caolan.github.io/async/docs.html#parallel) is used to run multiple asynchronous operations in parallel.

The first argument to `async.parallel()` is a collection of the asynchronous functions to run (an array, object or other iterable). Each function is passed a `callback(err, result)` which it must call on completion with an error `err` (which can be `null`) and an optional `results` value.

The optional second argument to `async.parallel()` is a callback that will be run when all the functions in the first argument have completed. The callback is invoked with an error argument and a result collection that contains the results of the individual asynchronous operations. The result collection is of the same type as the first argument (i.e. if you pass an array of asynchronous functions, the final callback will be invoked with an array of results). If any of the parallel functions reports an error the callback is invoked early (with the error value).

The example below shows how this works when we pass an object as the first argument. As you can see, the results are returned in an object with the same property names as the original functions that were passed in.
    
```js    
async.parallel({ 
  one: function(callback) { ... },
  two: function(callback) { ... },
  ...
  something_else: function(callback) { ... }
  }, 

  function(err, results) {

  }
);
```

If you instead pass an array of functions as the first argument, the results will be an array (the array order results will match the original order that the functions were declared—not the order in which they completed).
