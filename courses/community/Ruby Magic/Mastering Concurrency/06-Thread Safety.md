If you use multiple threads you have to be careful to write all code that manipulates shared data in a thread safe way. You can do this for example by using a **[Mutex](http://ruby-doc.org/core-2.2.0/Mutex.html)** to lock shared data structures before you manipulate them. This will ensure that other threads are not basing their work on stale data while you're changing the data.

**Multi-threaded** summary:

Use case:
* This is the "middle of the road" option. Used for a lot of standard web applications which should handle loads of short requests (such as a busy web application).

Pros: 
* Uses less memory than multi-process.

Cons: 
* You have to make sure your code is thread safe. 
* If a thread causes a a crash, it can potentially take down your process. 
* The GIL locks all operations except I/O. 
* If a thread causes a a crash, it can potentially take down your process.   
The GIL locks all operations except I/O.  | 
