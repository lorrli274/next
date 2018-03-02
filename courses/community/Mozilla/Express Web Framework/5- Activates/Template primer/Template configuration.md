The _LocalLibrary_ was configured to use [Pug][2] when we [created the skeleton website][4]. You should see the pug module included as a dependency in the website's **package.json** file, and the following configuration settings in the **app.js** file. The settings tell us that we're using pug as the view engine, and that _Express_ should search for templates in the **/views** subdirectory.
    
    
    app.set('views', path.join(__dirname, 'views'));
    app.set('view engine', 'pug');

If you look in the views directory you will see the .pug files for the project's default views. These include the view for the home page (**index.pug**) and base template (**layout.pug**) that we will need to replace with our own content.
    
    
    /express-locallibrary-tutorial  //the project root
      /views
        error.pug
        **index.pug**
        layout.pug
