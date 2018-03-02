To create the app we run the "create" command in the root directory of our repository. This creates a git remote ("pointer to a remote repository") named _heroku_ in our local git environment.
    
```js    
heroku create
```

You can name the remote if you like by specifying a value after "create". If you don't then you'll get a random name. The name is used in the default URL.

We can then push our app to the Heroku repository as shown below. This will upload the app, get all its dependencies, package it in a dyno, and start the site.
    
```js    
git push heroku master
```

If we're lucky, the app is now "running" on the site. To open your browser and run the new website, use the command:
    
```js    
heroku open
```

The site will be running using our development database. Create some books and other objects, and check out whether the site is behaving as you expect. In the next section we'll set it to use our new database.
