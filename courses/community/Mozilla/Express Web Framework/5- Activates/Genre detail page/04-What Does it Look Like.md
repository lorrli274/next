danger> http://localhost:3000/ needs to work in Codevolve? 

Run the application and open your browser to http://localhost:3000/. Select the _All genres_ link, then select one of the genres (e.g. "Fantasy"). If everything is set up correctly, your page should look something like the following screenshot.

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Mozilla/LocalLibary_Express_Genre_Detail.png)

You might get an error similar to this:
    
```js    
Cast to ObjectId failed for value " 59347139895ea23f9430ecbb" at path "_id" for model "Genre"
```

This is a mongoose error coming from the *req.params.id*. To solve this problem, first you need to require mongoose on the *genreController.js* page like this:
    
```js    
var mongoose = require('mongoose');
```

Then use mongoose.Types.ObjectId() to convert the id to a that can be used. For example:
    
```js
exports.genre_detail = function(req, res, next) {
    var id = mongoose.Types.ObjectId(req.params.id);  
    ...
```
