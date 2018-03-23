We hope you now have a better understanding of the different concurrency models. It's some of the more difficult subject matter to grasp as a developer, but understanding it will give you the tools to experiment and use the right setup for your app.

In summary:

* For most apps threading makes sense, Ruby/Rails ecosystem seems to (slowly) be moving this way.
* If you run highly concurrent apps with long-running streams, event-loop allows you to scale.
* If you don't have a high traffic site, or you expect your workers to break go for good old multi-process.

And, it is possible to run an event loop, inside a thread, inside a multi-process setup.
