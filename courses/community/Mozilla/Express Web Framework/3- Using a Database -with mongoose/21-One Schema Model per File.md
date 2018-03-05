While you can create schemas and models using any file structure you like, we highly recommend defining each model schema in its own module (file), exporting the method to create the model. This is shown below:
    
```js   
// File: ./models/somemodel.js

//Require Mongoose
var mongoose = require('mongoose');

//Define a schema
var Schema = mongoose.Schema;

var SomeModelSchema = new Schema({
    a_string          : String,
    a_date            : Date,
});

**//Export function to create "SomeModel" model class
module.exports = mongoose.model('SomeModel', SomeModelSchema );**
```

You can then require and use the model immediately in other files. Below we show how you might use it to get all instances of the model.
    
```Node.js    
//Create a SomeModel model just by requiring the module
var SomeModel = require('../models/somemodel')

// Use the SomeModel object (model) to find all SomeModel records
SomeModel.find(callback_function);
```
