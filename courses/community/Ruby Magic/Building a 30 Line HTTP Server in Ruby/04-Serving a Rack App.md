Until now, our server has been returning a single response for each request. To make it a little more useful, we could add more responses to our server. Instead of adding these to the server directly, we'll use a **Rack** app. Our server will parse HTTP requests and pass them to the Rack app, which will then return a response for the server to send back to the client.

Rack is an interface between web servers that support Ruby and most Ruby web frameworks like Rails and Sinatra. In its simplest form, a Rack app is an object that responds to `call` and returns a **tiplet**, an array with three items: an HTTP response code, a hash of HTTP headers and a body.

```ruby 
app = Proc.new do |env|

  ['200', {'Content-Type' => 'text/html'}, ["Hello world! The time is #{Time.now}"]]
end
```

In this example, the response code is `200`, we're passing `text/html` as the content type through the headers, and the body is an array with a string.

To allow our server to serve responses from this app, we'll need to turn the returned triplet into a HTTP response string. Instead of always returning a static response, like we did before, we'll now have to build the response from the triplet returned by the Rack app.

```ruby 
# http_server.rb
require 'socket'

app = Proc.new do
  ['200', {'Content-Type' => 'text/html'}, ["Hello world! The time is #{Time.now}"]]
end

server = TCPServer.new 5678

while session = server.accept
  request = session.gets
  puts request

  # 1
  status, headers, body = app.call({})

  # 2
  session.print "HTTP/1.1 #{status}rn"

  # 3
  headers.each do |key, value|
    session.print "#{key}: #{value}rn"
  end

  # 4
  session.print "rn"

  # 5
  body.each do |part|
    session.print part
  end
  session.close
end
```    


To serve the response we've received from the Rack app, there's some changes we'll make to our server:

1. Get the status code, headers, and body from the triplet returned by `app.call`.
2. Use the status code to build the status line
3. Loop over the headers and add a header line for each key-value pair in the hash
4. Print a newline to separate the status line and headers from the body
5. Loop over the body and print each part. Since there's only one part in our body array, it'll simply print our "Hello world"-message to the session before closing it.
