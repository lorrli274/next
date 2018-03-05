Open **/App.js** (in the root of your project) and copy the following text below where you declare the _Express application object_ (after the line `var app = express();`). Replace the database url string ('_insert_your_database_url_here_') with the location URL representing your own database (i.e. using the information from from mLab).
    
```js    
//Set up mongoose connection
var mongoose = require('mongoose');
var mongoDB = '_insert_your_database_url_here_';
mongoose.connect(mongoDB);
mongoose.Promise = global.Promise;
var db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));
```

As discussed in the Mongoose primer above, this code creates the default connection to the database and binds to the error event (so that errors will be printed to the console). 
