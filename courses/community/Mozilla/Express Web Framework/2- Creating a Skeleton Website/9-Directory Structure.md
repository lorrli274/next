The generated project, now that you have installed dependencies, has the following file structure (files are the items **not** prefixed with "/"). The **Package.json** file defines the application dependencies and other information. It also defines a startup script that will call the application entry point, the JavaScript file **/bin/www**. This sets up some of the application error handling and then loads **App.js** to do the rest of the work. The app routes are stored in separate modules under the **routes/** directory. The templates are stored under the /**views** directory.
    
```js    
/express-locallibrary-tutorial
    **app.js**
    /bin
        **www**
    **package.json**
    /node_modules
        [about 4,500 subdirectories and files]
    /public
        /images
        /javascripts
        /stylesheets
            **style.css**
    /routes
        **index.js**
        **users.js**
    /views
        **error.pug**
        **index.pug**
        **layout.pug**
 ```       
    

The following sections describe the files in a little more detail.
