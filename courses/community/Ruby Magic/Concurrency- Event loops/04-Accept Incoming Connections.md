Lets see if we have any new incoming connections. We use `accept_nonblock`, which will not wait for a client to connect. It will instead raise an error if there is no new client, and if that error occurs we catch it and go to the next step. If there is a new client we create the handler for it and put that on the `clients` store. We'll use the socket object as the key of that `Hash` so we can find the client handler later.

```ruby 
    begin
      socket = server.accept_nonblock
      nickname = socket.gets.chomp
      $client_handlers[socket] = create_client_handler(nickname, socket)
      puts "Accepted connection from #{nickname}"
    rescue IO::WaitReadable, Errno::EINTR
      # No new incoming connections at the moment
    end
``` 
