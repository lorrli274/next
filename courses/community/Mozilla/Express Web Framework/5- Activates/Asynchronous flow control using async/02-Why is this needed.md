Most of the methods we use in _Express_ are asynchronous—you specify an operation to perform, passing a callback. The method returns immediately, and the callback is invoked when the requested operation completes. By convention in _Express_, callback functions pass an _error_ value as the first parameter (or `null` on success) and the results from the function (if there are any) as the second parameter.

If a controller only needs to _perform **one **asynchronous operation_ to get the information required to render a page then the implementation is easy—we simply render the template in the callback. The code fragment below shows this for a function that renders the count of a model `SomeModel` (using the Mongoose [`count()][7]` method):
    
    
    exports.some_model_count = function(req, res, next) {
     
      SomeModel.count({ a_model_field: 'match_value' }, function (err, count) {
        // ... do something if there is an err
    
        // On success, render the result by passing count into the render function (here, as the variable 'data').
        res.render('the_template', { data: count } );
      });
    }
    

However what if you need to make **multiple **asynchronous queries, and you can't render the page until all the operations have completed? A naive implementation could "daisy chain" the requests, kicking off subsequent requests in the callback of a previous request, and rendering the response in the final callback. The problem with this approach is that our requests would have to be run in series, even though it might be more efficient to run them in parallel. This could also result in complicated nested code, commonly referred to as [callback hell][8].

A much better solution would be to execute all the requests in parallel and then have a single callback that executes when all of the queries have completed. This is the sort of flow operation that the _Async_ module makes easy!
