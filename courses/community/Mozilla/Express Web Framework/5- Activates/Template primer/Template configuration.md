The LocalLibrary was configured to use [Pug](https://pugjs.org/api/getting-started.html) when we [created the skeleton website](https://developer.mozilla.org/en-US/docs/Learn/Server-side/Express_Nodejs/skeleton_website). You should see the pug module included as a dependency in the website's *Package.json* file, and the following configuration settings in the *App.js* file. The settings tell us that we're using pug as the view engine, and that Express should search for templates in the */views* subdirectory.
    
```js
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');
```

If you look in the views directory you will see the .pug files for the project's default views. These include the view for the home page (*Index.pug*) and base template (*Layout.pug*) that we will need to replace with our own content.
    
```js    
/express-locallibrary-tutorial  //the project root
  /views
    error.pug
    **index.pug**
    layout.pug
```
