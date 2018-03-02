Mongoose provides built-in and custom validators, and synchronous and asynchronous validators. It allows you to specify both the acceptable range or values and the error message for validation failure in all cases.

The built-in validators include:

* All SchemaTypes have the built-in required validator. This is used to specify whether the field must be supplied in order to save a document.
* Numbers have min and max validators.
* Strings have: 
    * enum: specifies the set of allowed values for the field.
    * match: specifies a regular expression that the string must match.
    * maxlength and minlength for the string.

The example below (slightly modified from the Mongoose documents) shows how you can specify some of the validator types and error messages:
    
```js    
var breakfastSchema = new Schema({
  eggs: {
    type: Number,
    min: [6, 'Too few eggs'],
    max: 12
    required: [true, 'Why no eggs?']
  },
  drink: {
    type: String,
    enum: ['Coffee', 'Tea', 'Water',]
  }
});    
```
