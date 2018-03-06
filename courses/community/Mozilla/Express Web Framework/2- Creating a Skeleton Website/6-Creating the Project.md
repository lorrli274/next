For the sample Local Library app we're going to build, we'll create a project named Express-locallibrary-tutorial using the **Pug** template library and no CSS stylesheet engine.

First navigate to where you want to create the project and then run the Express Application Generator in the command prompt as shown:
    
```js    
express express-locallibrary-tutorial --view=pug
```    

The generator will create (and list) the project's files.
    
```js    
create : express-locallibrary-tutorial
create : express-locallibrary-tutorial/package.json
create : express-locallibrary-tutorial/app.js
create : express-locallibrary-tutorial/public/images
create : express-locallibrary-tutorial/public
create : express-locallibrary-tutorial/public/stylesheets
create : express-locallibrary-tutorial/public/stylesheets/style.css
create : express-locallibrary-tutorial/public/javascripts
create : express-locallibrary-tutorial/routes
create : express-locallibrary-tutorial/routes/index.js
create : express-locallibrary-tutorial/routes/users.js
create : express-locallibrary-tutorial/views
create : express-locallibrary-tutorial/views/index.pug
create : express-locallibrary-tutorial/views/layout.pug
create : express-locallibrary-tutorial/views/error.pug
create : express-locallibrary-tutorial/bin
create : express-locallibrary-tutorial/bin/www

install dependencies:
 > cd express-locallibrary-tutorial && npm install

run the app:
 > SET DEBUG=express-locallibrary-tutorial:* & npm start
```

At the end of the output the generator provides instructions on how you install the dependencies (as listed in the *Package.json* file) and then how to run the application.
