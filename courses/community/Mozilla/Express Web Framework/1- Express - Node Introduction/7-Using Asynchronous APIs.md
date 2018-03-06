JavaScript code frequently uses **asynchronous** rather than **synchronous** APIs for operations that may take some time to complete. A synchronous API is one in which each operation must complete before the next operation can start. For example, the following log functions are synchronous, and will print the text to the console in order (First, Second).
    
```js    
console.log('First');
console.log('Second');
```

By contrast, an asynchronous API is one in which the API will start an operation and immediately return (before the operation is complete). Once the operation finishes, the API will use some mechanism to perform additional operations. For example, the code below will print out "Second, First" because even though `setTimeout()` method is called first, and returns immediately, the operation doesn't complete for several seconds.
    
```js    
setTimeout(function() {
	 console.log('First');
	 }, 3000);
console.log('Second');
```

Using non-blocking asynchronous APIs is even more important on Node than in the browser, because Node is a single threaded event-driven execution environment. "single threaded" means that all requests to the server are run on the same thread (rather than being spawned off into separate processes). This model is extremely efficient in terms of speed and server resources, but it does mean that if any of your functions call synchronous methods that take a long time to complete, they will block not just the current request, but every other request being handled by your web application.

There are a number of ways for an asynchronous API to notify your application that it has completed. The most common way is to register a callback function when you invoke the asynchronous API, that will be called back when the operation completes. This is the approach used above.

info> Using callbacks can be quite "messy" if you have a sequence of dependent asynchronous operations that must be performed in order, because this results in multiple levels of nested callbacks. This problem is commonly known as "callback hell". This problem can be reduced by good coding practices like [async](https://www.npmjs.com/package/async), or even moving to ES6 features like [Promises](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise).

 A common convention for Node and Express is to use error-first callbacks. In this convention the first value in your callback functions is an error value, while subsequent arguments contain success data.
