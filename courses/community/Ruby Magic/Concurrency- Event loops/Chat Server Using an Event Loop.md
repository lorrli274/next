Using an **event loop** for our chat server requires you to have a different mental model than using threads or processes. In the classic approach, a thread or process is responsible for handling a single connection. Using an event loop you have a single thread in a single process that handles multiple connections. Let's see how this works by breaking it down.
Event loop


An event loop used by EventMachine or NodeJS for example works as follows. We start with informing the operating system we’re interested in certain events. For example, when a connection to a socket is opened. We do this by calling a function that registers interest on some IO object, such as a connection or socket.

When something happens on this IO object, the operating system sends an event to our program. We put these events on a queue. The event loop keeps popping events off the list and handles them one by one.

![](https://raw.githubusercontent.com/Codevolve/next/master/courses/community/Ruby%20Magic/assets/event-loops%20(1).svg?sanitize=true)

In a sense an event loop is not truly concurrent. It works sequentially in very small batches to simulate the effect.

To register interest and have the operating system pass IO events to us we'd have to write a C extension, as there is no API present for that in the Ruby standard library. Diving into that is outside of the scope of this article, so we're going to use `IO.select` instead to generate events. `IO.select` takes an array of `IO` objects to monitor. It waits until one or more of the objects from the array are ready for reading or writing, and it returns an array with just those `IO` objects.

The code that takes care of everything related to a connection is implemented as a `Fiber`: we'll call this code the "handler" from now on. A `Fiber` is a code block that can be paused and resumed. The Ruby VM doesn't do this automatically, so we have to resume and yield manually. We'll use the input from `IO.select` to inform our handlers when their connections are ready for reading or writing.

Like in the threaded and multi-process examples from the previous posts, we need some storage to keep track of the clients and the messages that are sent. We don't need a `Mutex` this time. Our event loop is running in a single thread, so there is no risk of objects being mutated at the same time by different threads.

```ruby
    client_handlers = {}
    messages = []
```

The client handler is implemented in the following `Fiber`. When the socket can be read from or written to, an event is triggered to which the `Fiber` responds. When the state is `:readable` it reads a line from the socket and pushes this onto the `messages` array. When the state is `:writable` it writes any messages that have been received from other clients since the last write to the client. After handling an event it calls `Fiber.yield`, so it will pause and wait for the next event.

```ruby
def create_client_handler(nickname, socket)
  Fiber.new do
    last_write = Time.now
    loop do
      state = Fiber.yield

      if state == :readable
        # Read a message from the socket
        incoming = read_line_from(socket)
        # All good, add it to the list to write
        $messages.push(
          :time => Time.now,
          :nickname => nickname,
          :text => incoming
        )
      elsif state == :writable
        # Write messages to the socket
        get_messages_to_send(last_write, nickname, $messages).each do |message|
          socket.puts "#{message[:nickname]}: #{message[:text]}"
        end
        last_write = Time.now
      end
    end
  end
end
```

So how do we trigger the `Fiber` to read or write at the right time when the `Socket` is ready? We use an event loop that has four steps:

```ruby
loop do
    # Step 1: Accept incoming connections
    accept_incoming_connections

    # Step 2: Get connections that are ready for reading or writing
    get_ready_connections

    # Step 3: Read from readable connections
    read_from_readable_connections

    # Step 4: Write to writable connections
    write_to_writable_connections
  end
 ```
 
Notice that there is no magic here. This is a normal Ruby loop.
