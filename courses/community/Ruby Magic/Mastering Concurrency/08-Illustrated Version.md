In this illustration, we're taking it a step further. The event loop now does a beautiful dance with the OS, queue and some memory.

![](https://raw.githubusercontent.com/Codevolve/next/master/courses/community/Ruby%20Magic/assets/event-loops.svg?sanitize=true)

1. The OS keeps track of network and disk availability.
2. When the OS sees the I/O is ready, it sends an event to the queue.
3. The queue is a list of events from which the event loop takes the top one.
4. The event loop handles the event.
5. It uses some memory to store meta data about the connections.
6. It can send a new event directly into the event queue again. For example, a message to shut down the queue based on the contents of an event.
7. If it wants to do an I/O operation, it tells the OS that it's interested in a specific I/O operation. The OS keeps track of the network and disk (see [1]) and adds an event again when I/O is ready.

Event-loop summary: 

Use case: When using a lot of concurrent connections to your users. Think of services like Slack. Chrome notifications.

Pros: Almost no memory overhead per connection. 
Scales to a huge number of parallel connections.

Cons: It's a difficult mental model to understand. 
Batch sizes must be small and predictable to avoid queues building up.
