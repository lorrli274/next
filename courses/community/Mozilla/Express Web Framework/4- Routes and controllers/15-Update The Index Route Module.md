We've set up all our new routes, but we still have a route to the original page. Let's instead redirect this to the new index page that we've created at the path '/catalog'.

Open */routes/index.js* and replace the existing route with the function below.
    
```js    
// GET home page.
router.get('/', function(req, res) {
	res.redirect('/catalog');
});
```

This is our first use of the redirect response method. This redirects to the specified page, by default sending HTTP status code "302 Found". You can change the status code returned if needed, and supply either absolute or relative paths.
