This application is more than just that index page. Visiting [http://localhost:5678/posts]({{localhost:5678}}) will display an empty list of posts. If we try to create a new post by filling in the new post form and pressing "Create post", we're once again greeted by an exception. This time, it's `ActionController::InvalidAuthenticityToken`.

The authenticity token is sent along when posting a form and is used to check if the request came from a trusted source. Our server is completely ignoring POST data right now, so the token isn't sent, and the request can't be verified.

Back when we first implemented our HTTP server, we used `session.gets` to get the first line (called the [Request-Line][11]), and parsed the HTTP method and path from that. Besides **parsing** the Request-Line, we ignored the rest of the request.

To be able to extract the POST data, we'll first need to understand how an HTTP request is structured. Looking at an example, we can see that the structure resembles an HTTP response:

```ruby    
POST /posts HTTP/1.1rn
Host: localhost:5678rn
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8rn
Accept-Encoding: gzip, deflatern
Accept-Language: en-usrn
Content-Type: application/x-www-form-urlencodedrn
Origin: http://localhost:5678rn
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/602.2.14 (KHTML, like Gecko) Version/10.0.1 Safari/602.2.14rn
Cookie: _wups_session=LzE0Z2hSZFNseG5TR3dEVEwzNE52U0lFa0pmVGlQZGtZR3AveWlyMEFvUHRPeXlQUzQ4L0xlKzNLVWtqYld2cjdiWkpmclZIaEhJd1R6eDhaZThFbVBlN2p6QWpJdllHL2F4Z3VseUZ6NU1BRTU5Y1crM2lLRVY0UzdSZkpwYkt2SGFLZUQrYVFvaFE0VjZmZlIrNk5BPT0tLUpLTHQvRHQ0T3FycWV0ZFZhVHZWZkE9PQ%3D%3D--4ef4508c936004db748da10be58731049fa190eern
Connection: keep-alivern
Upgrade-Insecure-Requests: 1rn
Referer: http://localhost:5678/posts/newrn
Content-Length: 369rn
rn
utf8=%E2%9C%93&authenticity_token=3fu7e8v70K0h9o%2FGNiXxaXSVg3nZ%2FuoL60nlhssUEHpQRz%2BM4ZIHjQduQMexvXrNoC2pjmhNPI4xNNA0Qkh5Lg%3D%3D&post%5Btitle%5D=My+first+post&post%5Bcreated_at%281i%29%5D=2017&post%5Bcreated_at%282i%29%5D=1&post%5Bcreated_at%283i%29%5D=23&post%5Bcreated_at%284i%29%5D=18&post%5Bcreated_at%285i%29%5D=47&post%5Bbody%5D=It+works%21&commit=Create+Post
```

Much like a response, an HTTP request consists of:

* A Request-Line (`POST /posts HTTP/1.1rn`), consisting of a method token (`POST`), a request URI (`/posts/`), and the HTTP version (`HTTP/1.1`), followed by a CRLF (a carriage return: r, followed by line feed: n) to indicate the end of the line
* Header lines (`Host: localhost:5678rn`). The header key, followed by a colon, then the value, and a CRLF.
* A newline (or a double CRLF) to separate the request line and headers from the body: (`rnrn`)
* The URL encoded POST body

After using `session.gets` to take the first line of the request (the Request-Line), we're left with some header lines and a body. To get the header lines, we need to retrieve lines from the session until we find a newline (`rn`).

For each header line, we'll split on the first colon. Everything before the colon is the key, and everything after is the value. We `#strip` the value to remove the newline from the end.

To know how many bytes we need to read from the request to get the body, we use the "Content-Length" header, which the browser automatically includes when sending a request.

```  
# http_server.rb
# ...
  headers = {}
  while (line = session.gets) != "rn"
    key, value = line.split(':', 2)
    headers[key] = value.strip
  end

  body = session.read(headers["Content-Length"].to_i)
# ...
```    

Now, instead of sending an empty object, we'll send a `StringIO` instance with the body we received via the request. Also, since we're now parsing the cookies from the request's header, we can add them to the Rack environment in the `HTTP_COOKIE` variable to pass the request authenticity check.

```ruby    
# http_server.rb
# ...
  status, headers, body = app.call({
    # ...
    'REMOTE_ADDR' => '127.0.0.1',
    'HTTP_COOKIE' => headers['Cookie'],
    'rack.version' => [1,3],
    'rack.input' => StringIO.new(body),
    'rack.errors' => $stderr,
    # ...
  })
# ...
```

There we go. If we restart the server and try to submit the form again, you'll see that we successfully created the first post on our blog!

![](https://github.com/Codevolve/next/blob/master/courses/community/Ruby%20Magic/assets/first-post.png?raw=true)

We seriously upgraded our web server this time. Instead of just accepting GET requests from a Rack app, we're now serving a complete Rails app that handles POST requests. And we still haven't written more than fifty lines of code in total!
