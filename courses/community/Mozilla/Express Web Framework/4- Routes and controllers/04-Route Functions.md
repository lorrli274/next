Our module above defines a couple of typical **route functions**. The "about" route (reproduced below) is defined using the `Router.get()` method, which responds only to HTTP GET requests. The first argument to this method is the URL path while the second is a callback function that will be invoked if an HTTP GET request with the path is received.

```js
router.get('/about', function (req, res) {
res.send('About this wiki');
})
```

The callback takes three arguments (usually named as shown: `req`, `res`, `next`), that will contain the HTTP Request object, HTTP response, and the next function in the middleware chain.

Router functions are Express middleware, which means that they must either complete (respond to) the request or call the `next` function in the chain. In the case above we complete the request using `send()`, so the `next` argument is not used (and we choose not to specify it).

info> The  router function above takes a single callback, but you can specify as many callback arguments as you want, or an array of callback functions. Each function is part of the middleware chain, and will be called in the order it is added to the chain (unless a preceding function completes the request).

The callback function here calls send on the response to return the string "About this wiki" when we receive a GET request with the path ('`/about'`). There are a number of other response methods for ending the request/response cycle. For example, you could call `res.json` to send a JSON response or `res.sendFile` to send a file. The response method that we'll be using most often as we build up the library is render, which creates and returns HTML files using templates and data—we'll talk a lot more about that in a later article!
