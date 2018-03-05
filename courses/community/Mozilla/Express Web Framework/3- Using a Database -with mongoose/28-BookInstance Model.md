Finally, copy the `BookInstance` schema code shown below and paste it into your **./models/Bookinstance.js** file. The `BookInstance` represents a specific copy of a book that someone might borrow, and includes information about whether the copy is available or on what date it is expected back, "imprint" or version details.
    
```js    
var mongoose = require('mongoose');

var Schema = mongoose.Schema;

var BookInstanceSchema = new Schema(
  {
    book: { type: Schema.ObjectId, ref: 'Book', required: true }, //reference to the associated book
    imprint: {type: String, required: true},
    status: {type: String, required: true, **enum: ['Available', 'Maintenance', 'Loaned', 'Reserved']**, **default: 'Maintenance'**},
    due_back: {type: Date, **default: Date.now**}
  }
);

// Virtual for bookinstance's URL
BookInstanceSchema
.virtual('url')
.get(function () {
  return '/catalog/bookinstance/' + this._id;
});

//Export model
module.exports = mongoose.model('BookInstance', BookInstanceSchema);
```

The new things we show here are the field options:

* `enum`: This allows us to set the allowed values of a string. In this case we use it to specify the availability status of our books (using an enum means that we can prevent mis-spellings and arbitrary values for our status)
* `default`: We use default to set the default status for newly created bookinstances to maintenance and the default `due_back` date to `now` (note how you can call the Date function when setting the date!)

Everything else should be familiar from our previous schema.
