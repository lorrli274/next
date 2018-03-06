Any changes you make to your Express website are currently not visible until you restart the server. It quickly becomes very irritating to have to stop and restart your server every time you make a change, so it is worth taking the time to automate restarting the server when needed.

One of the easiest such tools for this purpose is **nodemon**. This is usually installed globally (as it is a "tool"), but here we'll install and use it locally as a developer dependency, so that any developers working with the project get it automatically when they install the application. Use the following command in the root directory for the skeleton project:
    
```js    
npm install --save-dev nodemon
```

If you open your project's _Package.json_** file you'll now see a new section with this dependency:
    
```js    
"devDependencies": {
"nodemon": "^1.14.11"
}
```    

Because the tool isn't installed globally we can't launch it from the command line (unless we add it to the path) but we can call it from an NPM script because NPM knows all about the installed packages. Find the the `scripts` section of your package.json. Initially it will contain one line, which begins with `"start"`. Update it by putting a comma at the end of that line, and adding the `"devstart"` line seen below:
    
```js    
"scripts": {
"start": "node ./bin/www"**,**
**    "devstart": "nodemon ./bin/www"**
},
```    

We can now start the server in almost exactly the same way as previously, but with the devstart command specified:

Now if you edit any file in the project the server will restart (or you can restart it by typing `rs` on the command prompt at any time). You will still need to reload the browser to refresh the page.

We now have to call "`npm run __`" rather than just `npm start`, because "start" is actually an NPM command that is mapped to the named script. We could have replaced the command in the start script but we only want to use nodemon during development, so it makes sense to create a new script command.
