The method [**async.waterfall**](http://caolan.github.io/async/docs.html#waterfall) is used to run multiple asynchronous operations in sequence when each operation is dependent on the result of the previous operation.

The callback invoked by each asynchronous function contains `null` for the first argument and results in subsequent arguments. Each function in the series takes the results arguments of the previous callback as the first parameters, and then a callback function. When all operations are complete, a final callback is invoked with the result of the last operation. The way this works is more clear when you consider the code fragment below (this example is from the async documentation):
    
```js    
async.waterfall([
  function(callback) {
    callback(null, 'one', 'two'); 
  }, 
  function(arg1, arg2, callback) { 

    callback(null, 'three'); 
  }, 
  function(arg1, callback) {

    callback(null, 'done');
  }
], function (err, result) {

}
);
```
