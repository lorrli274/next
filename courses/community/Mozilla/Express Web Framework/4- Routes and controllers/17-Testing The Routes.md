To **test** the routes, first start the website using your usual approach

* The default method 

```js
		// Windows
SET DEBUG=express-locallibrary-tutorial:* & npm start

// macOS or Linux
DEBUG=express-locallibrary-tutorial:* npm start
```

* If you previously set up nodemon, you can instead use: 

```js
		// Windows
SET DEBUG=express-locallibrary-tutorial:* & npm **run devstart**

// macOS or Linux
DEBUG=express-locallibrary-tutorial:* npm **run devstart**
```

Then navigate to a number of LocalLibrary URLs, and verify that you don't get an error page (HTTP 404).A small set of URLs are listed below for your convenience:

http://localhost:3000/
http://localhost:3000/catalog
http://localhost:3000/catalog/books
http://localhost:3000/catalog/bookinstances/
http://localhost:3000/catalog/authors/
http://localhost:3000/catalog/genres/
http://localhost:3000/catalog/book/5846437593935e2f8c2aa226
http://localhost:3000/catalog/book/create
