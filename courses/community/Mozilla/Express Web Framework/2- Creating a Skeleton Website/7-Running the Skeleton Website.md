At this point we have a complete skeleton project. The website doesn't actually _do_ very much yet, but it's worth running it to show how it works.

1. First install the dependencies (the `install` command will fetch all the dependency packages listed in the project's **Package.json** file). 

```js
    cd express-locallibrary-tutorial
npm install
```

2. Then run the application. 
3. Then load  in your browser to access the app.

You should see a browser page that looks like this:

Browser for default Express app generator website

You have a working Express application, serving itself to _localhost:3000_.

You could also start the app just using the `npm start` command. Specifying the DEBUG variable as shown enables console logging/debugging. For example, when you visit the above page you'll see debug output like this:
    
```bash
>SET DEBUG=express-locallibrary-tutorial:* & npm start

> express-locallibrary-tutorial@0.0.0 start D:express-locallibrary-tutorial
> node ./bin/www

  express-locallibrary-tutorial:server Listening on port 3000 +0ms
GET / 200 288.474 ms - 170
GET /stylesheets/style.css 200 5.799 ms - 111
GET /favicon.ico 404 34.134 ms - 1335
```
