Until now, our server has been ignoring the `request` variable. We didn't need to as our Rack app always returned the same response. 

`Rack::Lobster` is an example app that ships with Rack and uses request URL parameters in order to function. Instead of the Proc we used as an app before, we'll use that as our testing app from now on.

```python
# http_server.rb
require 'socket'
require 'rack'
require 'rack/lobster'

app = Rack::Lobster.new
server = TCPServer.new 5678

while session = server.accept
# ...
```

Opening the browser will now show a lobster instead of the boring string it printed before. Lobstericious! 

![](https://github.com/Codevolve/next/blob/master/courses/community/Ruby%20Magic/assets/http_server_lobster.png?raw=true)

The "flip!" and "crash!" links link to `/?flip=left` and `/?flip=crash` respectively. However, when following the links, the lobster doesn't flip and nothing crashes just yet. That's because our server doesn't handle query strings right now. Remember the `request` variable we ignored before? If we look at our server's logs, we'll see the request strings for each of the pages.

```ruby
GET / HTTP/1.1
GET /?flip=left HTTP/1.1
GET /?flip=crash HTTP/1.1
```    

The HTTP request strings include the request method ("GET"), the request path (`/`, `/?flip=left` and `/?flip=crash`), and the HTTP version. We can use this information to determine what we need to serve.

 ```ruby    
# http_server.rb
require 'socket'
require 'rack'
require 'rack/lobster'

app = Rack::Lobster.new
server = TCPServer.new 5678

while session = server.accept
  request = session.gets
  puts request

  # 1
  method, full_path = request.split(' ')
  # 2
  path, query = full_path.split('?')

  # 3
  status, headers, body = app.call({
    'REQUEST_METHOD' => method,
    'PATH_INFO' => path,
    'QUERY_STRING' => query
  })

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

To parse the request and send the request parameters to the Rack app, we'll split the request string up and send it to the Rack app:

1. Split the request string into a method and a full path
2. Split the full path into a path and a query
3. Pass those to an app in a [Rack environment hash](http://www.rubydoc.info/github/rack/rack/file/SPEC#The_Environment).

For example, a request like `GET /?flip=left HTTP/1.1rn` will be passed to the app like this:

```    
{
  'REQUEST_METHOD' => 'GET',
  'PATH_INFO' => '/',
  'QUERY_STRING' => '?flip=left'
}
```

Restarting our server, visiting [http://localhost:5678]({{localhost:5678}}), and clicking the "flip!"-link will now flip the lobster, and clicking the "crash!" link will crash our web server.

We've just scratched the surface of implementing a HTTP server, and ours is only 30 lines of code, but it explains the basic idea. It accepts GET requests, passes the request's attributes to a Rack app, and sends back responses to the browser. Although it doesn't handle things like request streaming and POST requests, our server could theoretically be used to serve other Rack apps too.
