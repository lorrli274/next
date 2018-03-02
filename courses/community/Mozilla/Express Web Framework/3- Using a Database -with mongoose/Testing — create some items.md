That's it. We now have all models for the site set up!

In order to test the models (and to create some example books and other items that we can use in our next articles) we'll now run an _independent_ script to create items of each type:

1. Download (or otherwise create) the file populatedb.js inside your _express-locallibrary-tutorial_ directory (in the same level as `package.json`). 

You don't need to know how populatedb.js works; it just adds sample data into the database.

2. Enter the following commands in the project root to install the _async_ module that is required by the script (we'll discuss this in later tutorials, ) 

```js
npm install async --save
```

3. Run the script using node in your command prompt, passing in the URL of your _MongoDB_ database (the same one you replaced the _insert_your_database_url_here _placeholder with, inside `app.js` earlier): 

```js
node populatedb 
```

4. The script should run through to completion, displaying items as it creates them in the terminal.

Go to your database on mLab. You should now be able to drill down into individual collections of Books, Authors, Genres and BookInstances, and check out individual documents.
