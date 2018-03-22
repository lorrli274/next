We will need to accept incoming connections and set up the pipes. The new writer will be pushed onto the `client_writers` array. The main process will be able to loop through the array and send a message to each worker process by writing to its pipe.

We then fork the master process, and the code within the forked worker process will handle the client connection.

```ruby
loop do
  while socket = server.accept
    # Create a client reader and writer so that the master
    # process can write messages back to us.
    client_reader, client_writer = IO.pipe

    # Put the client writer on the list of writers so the
    # master process can write to them.
    client_writers.push(client_writer)

    # Fork child process, everything in the fork block
    # only runs in the child process.
    fork do
      # Handle connection
    end
  end
end
```
