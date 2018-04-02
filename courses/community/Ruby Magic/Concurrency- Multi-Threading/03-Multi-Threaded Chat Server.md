Now we're getting to the part that is different compared to the multi-process implementation. Using **Multi-threading** we can do multiple things at the same time with just one Ruby process. We will do this by spawning multiple threads that do the work.

Some storage will be needed to store the incoming chat messages. We'll be using a plain `Array`, but we also need a `Mutex` to make sure that only one thread changes the messages at the same time (we'll see how the `Mutex` works in a bit).

```ruby
mutex = Mutex.new
messages = []
```

Next up we start a loop in which we'll accept incoming connections from chat clients. Once a connection has been established, we'll spawn a thread to handle the incoming and outgoing messages from that client connection.

The `Thread.new` call blocks until `server.accept` returns something, and then yields the following block in the newly created thread. The code in the thread then proceeds to read the first line that's sent and stores this as the nickname. Finally it starts sending and reading messages.

```ruby    
loop do
  Thread.new(server.accept) do |socket|
    nickname = read_line_from(socket)

    # Send incoming message (coming up)

    # Read incoming messages (coming up)
  end
end
```

The server reads incoming messages from the socket. It uses `synchronize` to get a lock on the messages store, so it can safely add a message to the messages `Array`.

```ruby    
# Read incoming messages
while incoming = read_line_from(socket)
  mutex.synchronize do
    messages.push(
      :time => Time.now,
      :nickname => nickname,
      :text => incoming
    )
  end
end
```

Finally, a `Thread` is spawned that runs continuously in a loop, to make sure all the new messages that have been received by the server are being sent to the client. Again it gets a lock so it knows that other threads are not interfering. After it's done with a tick of the loop it sleeps for a bit and then continues.

```ruby   
# Send incoming message
Thread.new do
  sent_until = Time.now
  loop do
    messages_to_send = mutex.synchronize do
      get_messages_to_send(nickname, messages, sent_until).tap do
        sent_until = Time.now
      end
    end
    messages_to_send.each do |message|
      socket.puts "#{message[:nickname]}: #{message[:text]}"
    end
    sleep 0.2
  end
end
```
