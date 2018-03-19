* For most apps threading makes sense, Ruby/Rails ecosystem seems to (slowly) be moving this way.
* If you run highly concurrent apps with long-running streams, event-loop allows you to scale.
* If you don't have a high traffic site, or you expect your workers to break go for good old multi-process.

And, it is possible to run an event loop, inside a thread, inside a multi-process setup. So yes, you can have your stroopwafel and eat it too!

If you want to read more more about these concurrency models check out our detailed articles on [multi-process][7] , [multi-threading][8] and [event loops][9] . 

[1]: https://en.wikipedia.org/wiki/Fork_(system_call)
[2]: /images/blog/2016-02/multi-process.svg?1521209011
[3]: https://www.google.com/googlebooks/chrome/small_04.html
[4]: /images/blog/2016-02/threaded.svg?1521209011
[5]: http://ruby-doc.org/core-2.2.0/Mutex.html
[6]: /images/blog/2016-02/event-loops.svg?1521209011
[7]: https://blog.appsignal.com/2017/03/07/ruby-magic-concurrency-processes.html
[8]: https://blog.appsignal.com/2017/04/18/ruby-magic-concurrency-threads.html
[9]: https://blog.appsignal.com/2017/06/06/ruby-magic-concurrency-event-loop.html
