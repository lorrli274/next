The controller code for some of our _LocalLibrary_ pages will depend on the results of multiple asynchronous requests, which may be required to run either in some particular order or in parallel. In order to manage flow control, and render pages when we have all the required information available, we'll use the popular node [async][1] module.

Info> There are a number of other ways to manage asynchronous behaviour and flow control in JavaScript, including relatively recent JavaScript language features like [Promises][2].

