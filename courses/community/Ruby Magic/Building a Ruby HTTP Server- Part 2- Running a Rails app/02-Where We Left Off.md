Last time, we implemented just enough of a server to have it serve [Rack::Lobster](https://github.com/rack/rack/blob/master/lib/rack/lobster.rb) as an example application.

1. Our implementation opened a TCP server and waited for a request to come in.
2. When that happened, the request-line (`GET /?flip=left HTTP/1.1rn`) was parsed to get the request method (`GET`), the path (`/`), and the query parameters (`flip=left`).
3. The request method, the path and the query string were passed to the Rack app, which returned a triplet with a status, some response headers and the response body.
4. Using those, we were able to build an HTTP response to send back to the browser, before closing the connection to wait for a new request to come in.

```ruby    
# http_server.rb
require 'socket'
require 'rack'
require 'rack/lobster'

app = Rack::Lobster.new
server = TCPServer.new 5678

#1
while session = server.accept
  request = session.gets
  puts request

  #2
  method, full_path = request.split(' ')
  path, query = full_path.split('?')

  #3
  status, headers, body = app.call({
    'REQUEST_METHOD' => method,
    'PATH_INFO' => path,
    'QUERY_STRING' => query
  })

  #4
  session.print "HTTP/1.1 #{status}rn"
  headers.each do |key, value|
    session.print "#{key}: #{value}rn"
  end
  session.print "rn"
  body.each do |part|
    session.print part
  end
  session.close
end
```

We'll be continuing with the code we wrote last time. You can find it right [here].(https://gist.github.com/jeffkreeftmeijer/7f08d1f7e381b9c552666750914925eb)
