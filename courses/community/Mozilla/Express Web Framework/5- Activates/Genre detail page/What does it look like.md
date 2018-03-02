Run the application and open your browser to . Select the _All genres_ link, then select one of the genres (e.g. "Fantasy"). If everything is set up correctly, your page should look something like the following screenshot.

![Genre Detail Page - Express Local Library site][3]

You might get an error similar to this:
    
    
    Cast to ObjectId failed for value " 59347139895ea23f9430ecbb" at path "_id" for model "Genre"
    

This is a mongoose error coming from the **req.params.id**. To solve this problem, first you need to require mongoose on the **genreController.js** page like this:
    
    
     var mongoose = require('mongoose');
    

Then use **mongoose.Types.ObjectId() **to convert the id to a that can be used. For example:
    
    
    exports.genre_detail = function(req, res, next) {
        var id = mongoose.Types.ObjectId(req.params.id);  
        ...
    
