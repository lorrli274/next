You can use the [express.static](http://expressjs.com/en/4x/api.html#express.static) middleware to **serve static files**, including your images, CSS and JavaScript (`static()` is the only middleware function that is actually **part** of Express). For example, you would use the line below to serve images, CSS files, and JavaScript files from a directory named **'public'** at the same level as where you call node:
    
```js    
app.use(express.static('public'));
```    

Any files in the public directory are served by adding their filename (relative to the base "public" directory) to the base URL. So for example:
    
```js    
http://localhost:3000/images/dog.jpg
http://localhost:3000/css/style.css
http://localhost:3000/js/app.js
http://localhost:3000/about.html
```

You can call `static()` multiple times to serve multiple directories. If a file cannot be found by one middleware function then it will simply be passed on to the subsequent middleware (the order that middleware is called is based on your declaration order).
    
```js    
app.use(express.static('public'));
app.use(express.static('media'));
```

You can also create a virtual prefix for your static URLs, rather than having the files added to the base URL. For example, here we [specify a mount path](http://expressjs.com/en/4x/api.html#app.use) so that the files are loaded with the prefix "/media":
    
```js    
app.use('/media', express.static('public'));
```    

Now, you can load the files that are in the `public` directory from the `/media` path prefix.
    
```js    
http://localhost:3000/media/images/dog.jpg
http://localhost:3000/media/video/cat.mp4
http://localhost:3000/media/cry.mp3
```
