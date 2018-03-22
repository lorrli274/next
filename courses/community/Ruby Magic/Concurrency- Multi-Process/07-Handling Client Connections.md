We also need to handle the client connection.

The forked process starts by getting the nickname from the client [the client sends the nickname by default](https://github.com/thijsc/three-chat-servers/blob/master/client.rb#L19). After that it starts a thread in `write_incoming_messages_to_client` that [listens for messages from the main process](https://github.com/thijsc/three-chat-servers/blob/master/lib/processes.rb#L15).

Finally, the forked process starts a loop that listens for incoming messages and sends them to the master process. The master process makes sure the other worker process receive the message.

```ruby
    nickname = read_line_from(socket)
    puts "#{Process.pid}: Accepted connection from #{nickname}"
    
    write_incoming_messages_to_client(nickname, client_reader, socket)
    
    # Read incoming messages from the client.
    while incoming = read_line_from(socket)
      master_writer.puts "#{nickname}: #{incoming}"
    end
    
    puts "#{Process.pid}: Disconnected #{nickname}"
```
