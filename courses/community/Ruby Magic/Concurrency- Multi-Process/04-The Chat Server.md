In this step a client connects to a chat server in order to communicate with other clients. For all three concurrency approaches we will use the same TCP server from Ruby's standard library.

```ruby    
# server_processes.rb
# $ ruby server_processes.rb
require 'socket'

puts 'Starting server on port 2000'

server = TCPServer.open(2000)
```

Up to this point the code is the same for all three concurrency models. The chat server in every model will then need to handle two scenarios:

1. Accept new connections from clients.
2. Receive messages from clients and send them to all the other clients.
