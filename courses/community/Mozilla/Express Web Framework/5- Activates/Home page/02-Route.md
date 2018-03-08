We created our index page **routes** in a previous lesson. As a reminder, all the route functions are defined in */routes/catalog.js*:
    
```js    
router.get('/', book_controller.index);  
```

Where the callback function parameter (`book_controller.index`) is defined in */controllers/bookController.js*:
    
```js    
exports.index = function(req, res, next) {   
    res.send('NOT IMPLEMENTED: Site Home Page');
}
```

It is this controller function that we extend to get information from our models and then render it using a template (view).
