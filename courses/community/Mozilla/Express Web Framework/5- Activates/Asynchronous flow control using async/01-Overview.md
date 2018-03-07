The controller code for some of our LocalLibrary pages will depend on the results of multiple **asynchronous** requests, which may be required to run either in some particular order or in parallel. In order to manage flow control, and render pages when we have all the required information available, we'll use the popular node [async](https://www.npmjs.com/package/async) module.

Info> There are a number of other ways to manage asynchronous behaviour and flow control in JavaScript, including relatively recent JavaScript language features like [Promises](https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/Techniques/Promises).

