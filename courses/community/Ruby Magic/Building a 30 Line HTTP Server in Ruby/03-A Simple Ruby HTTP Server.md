Enough talk. Now that we know how to create a **TCP** server in Ruby and what some HTTP requests and responses look like, we can build a really simple HTTP server. You'll notice that the web server looks mostly the same as the TCP server we discussed earlier. The general idea is the same, we're just using the HTTP protocol to format our message. Also, because we'll use a browser to send requests and parse responses, we won't have to implement a client this time.

```ruby
# http_server.rb
require 'socket'
server = TCPServer.new 5678

while session = server.accept
  request = session.gets
  puts request

  session.print "HTTP/1.1 200rn" # 1
  session.print "Content-Type: text/htmlrn" # 2
  session.print "rn" # 3
  session.print "Hello world! The time is #{Time.now}" #4

  session.close
end
```

After the server receives a request, like before, it uses `session.print` to send a message back to the client: Instead of just our message, it prefixes the response with a status line, a header and a newline:

1. The status line (`HTTP 1.1 200rn`) to tell the browser that the HTTP version is 1.1 and the response code is "200"
2. A header to indicate that the response has a text/html content type (`Content-Type: text/htmlrn`)
3. The newline (`rn`)
4. The body: "Hello world! …"

Like before, it closes the connection after sending the message. We're not reading the request yet, so it just prints it to the console for now.

If you start the server and open (http://localhost:5678)({{localhost:3000}}) in your browser, you should see the "Hello world! …"-line with the current time, like we received from our TCP client earlier. 🎉

![](https://raw.githubusercontent.com/Codevolve/next/master/courses/community/Ruby%20Magic/assets/http_server.png)
