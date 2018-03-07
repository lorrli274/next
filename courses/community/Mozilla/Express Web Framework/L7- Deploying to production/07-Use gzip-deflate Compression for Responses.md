Web servers can often **compress** the HTTP response sent back to a client, significantly reducing the time taken to for the client to get and load the page. The **compression method** used will depend on what decompression methods the client says that it supports in the request (if no compression methods are supported the response will be sent uncompressed).

You can add this to your site using compression middleware. Install this to your project by running the following command at the root of the project.
    
```js    
npm install compression --save
```

Open _./App.js_ and require the compression library as shown. Add the compression library to the middleware chain with the `use()` method (this should appear before any routes that you want compressed — in this case all of them!)
    
```js    
var catalog = require('./routes/catalog'); //Import routes for "catalog" area of site
var compression = require('compression');

// Create the Express application object
var app = express();

...

app.use(compression()); //Compress all routes

app.use(express.static(path.join(__dirname, 'public')));

app.use('/', index);
app.use('/users', users);
app.use('/catalog', catalog);  // Add catalog routes to middleware chain.

...
```    

Info> For a high-traffic website in production you wouldn't use this middleware. Instead you would use a reverse proxy like Nginx.
