In order to implement our form handling code we will need two routes that have the same URL pattern. The first (`GET`) route is used to display a new empty form for creating the object. The second route (`POST`) is used for validating data entered by the user, and then saving the information and redirecting to the detail page (if the data is valid) or redisplaying the form with errors (if the data is invalid).

We have already created the routes for all our model's create pages in _/routes/catalog.js_. For example, the genre routes are shown below:
    
```javascript
// GET request for creating a Genre.
// NOTE: This must come before route that displays Genre (uses id).
router.get('/genre/create', genre_controller.genre_create_get);

// POST request for creating Genre.
router.post('/genre/create', genre_controller.genre_create_post);
```

In the next lesson, you'll build out complete support for creating, updating, and deleting book genres!
