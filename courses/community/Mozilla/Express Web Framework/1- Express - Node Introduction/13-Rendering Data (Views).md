**Template engines** (referred to as **view engines** by Express) allow you to specify the **structure** of an output document in a template, using placeholders for data that will be filled in when a page is generated. Templates are often used to create HTML, but can also create other types of documents. Express has support for a [number](https://github.com/expressjs/express/wiki#template-engines) of template engines, and there is a useful comparison of the more popular engines [here](https://developer.ibm.com/node/2014/11/11/compare-javascript-templates-jade-mustache-dust/)

In your application settings code you set the template engine to use and the location where Express should look for templates using the 'views' and 'view engines' settings, as shown below (you will also have to install the package containing your template library too!)
    
```js    
var express = require('express');
var app = express();

// Set directory to contain the templates ('views')
app.set('views', path.join(__dirname, 'views'));

// Set view engine to use, in this case 'some_template_engine_name'
app.set('view engine', 'some_template_engine_name');
```

The appearance of the template will depend on what engine you use. Assuming that you have a template file named "index." that contains placeholders for data variables named 'title' and "message", you would call `Response.render()` in a route handler function to create and send the HTML response:
    
```js    
app.get('/', function(req, res) {
	res.render('index', { title: 'About dogs', message: 'Dogs rock!' });
});
```
