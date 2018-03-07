**Helmet** is a middleware package that can help protect your app from some well-known web vulnerabilities by setting appropriate HTTP headers.

Install this to your project by running the following command at the root of the project.
    
```js    
npm install helmet --save
```    

Open _./App.js_ and require the helmet library as shown. Then add the module to the middleware chain with the `use()` method.
    
```js    
var compression = require('compression');
var helmet = require('helmet');

// Create the Express application object
var app = express();

app.use(helmet());
...
```

Info> The command above adds the subset of available headers that makes sense for most sites. You can add/disable specific headers as needed by following the instructions on npm.
