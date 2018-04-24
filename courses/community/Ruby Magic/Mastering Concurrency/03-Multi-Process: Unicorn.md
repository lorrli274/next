This is the easiest way to handle concurrency. A master process forks itself to multiple worker processes. The worker process handles the actual requests, while the master manages the workers.

![](https://raw.githubusercontent.com/Codevolve/next/master/courses/community/Ruby%20Magic/assets/multi-process.svg?sanitize=true)

Each worker process has the full codebase in memory. This makes this method pretty memory-intensive, and makes it hard to scale to larger infrastructures.

**Multi-Process** summary:

Use case:
* One non-ruby example you probably know is the [Chrome browser](https://www.google.com/googlebooks/chrome/small_04.html). It uses multi-process concurrency to give each tab their own process. It allows a single tab to crash without taking the full application down. In their case, it also helps to isolate exploits to a single tab 

Pros:
* Most simple to implement. 
* Ignores difficulties with thread safety. 
* Each worker can crash without damaging the rest of the system.

Cons: 
* Each process loads the full codebase in memory. This makes it memory-intensive.   
* It does not scale to large amounts of concurrent connections.
