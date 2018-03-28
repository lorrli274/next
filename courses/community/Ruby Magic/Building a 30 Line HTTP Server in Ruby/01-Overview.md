Web servers, and HTTP in general, might seem difficult to understand. How does the browser format a request, and how does the response get sent to the user? In this Ruby Magic lesson we'll learn how a to build a simple Ruby HTTP server in 30 lines of code. When we're done, our server will handle HTTP GET requests and we'll use it to serve a simple Rack app.

```ruby    
# tcp_server.rb
require 'socket'
server = TCPServer.new 5678

while session = server.accept
  session.puts "Hello world! The time is #{Time.now}"
  session.close
end
```

In this example of a TCP server, the server binds to port `5678` and waits for a client to connect. When that happens, it sends a message to the client, and then closes the connection. After it's done talking to the first client, the server waits for another client to connect to send its message to again.

```ruby
# tcp_client.rb
require 'socket'
server = TCPSocket.new 'localhost', 5678

while line = server.gets
  puts line
end

server.close
```

To connect to our server, we'll need a simple TCP client. This example client connects to the same port (`5678`) and uses `server.gets` to receive data from the server, which is then printed. When it stops receiving data, it closes the connection to the server and the program will exit.

When you start the server server is running (`$ ruby tcp_server.rb`), you can start the client in a separate tab to receive the server's message.

```
$ ruby tcp_client.rb
Hello world! The time is 2016-11-23 15:17:11 +0100
$
```

With a bit of imagination, our TCP server and client work somewhat like a web server and a browser. The client sends a request, the server responds, and the connection is closed. That's how the request-response pattern works, which is exactly what we need to build an HTTP server.

Before we get to the good part, let's look at what HTTP requests and responses look like.
