Back when we implemented our server, we glossed over the **Rack** environment and ignored most of the variables that are required to properly serve Rack applications. We ended up only implementing the `REQUEST_METHOD`, `PATH_INFO`, and `QUERY_STRING` variables, as those were sufficient for our simple Rack app.

As we've already seen from the exception when we tried to start our new application, Rails needs `rack.input`, which is used as an input stream for raw HTTP POST data. Besides that, there are some more variables we need to pass, like the server's port number, and the request cookie data.

Luckily, Rack provides `Rack::Lint` to help make sure all variables in the Rack environment are present and valid. We can use it to test our server by wrapping our Rails app in it by calling `Rack::Lint.new` and passing the `Rails.application`.

```ruby
# http_server.rb
require 'socket'
require_relative 'blog/config/environment'

app = Rack::Lint.new(Rails.application)
server = TCPServer.new 5678
# ...
```    

`Rack::Lint` will throw an exception when a variable in the environment is missing or invalid. Right now, starting our server again and opening http://localhost:5678 will crash the server and `Rack::Lint` will notify us of the first error: the `SERVER_NAME` variable wasn't set.

```ruby
~/Appsignal/http-server (master) $ ruby http_server.rb
GET / HTTP/1.1
/Users/jeff/.rbenv/versions/2.4.0/lib/ruby/gems/2.4.0/gems/rack-2.0.1/lib/rack/lint.rb:20:in `assert': env missing required key SERVER_NAME (Rack::Lint::LintError)
        ...
        from http_server.rb:15:in `<main>'
```
 
By fixing each error that is thrown at us, we can keep adding variables until `Rack::Lint` stops crashing our server. Let's go over each of the variables `Rack::Lint` requires.

* `SERVER_NAME`: the server's hostname. We're only running this server locally right now, so we'll use "localhost".
* `SERVER_PORT`: the port our server is running on. We've hardcoded the port number (5678), so we'll just pass that to the Rack environment.
* `rack.version`: the targeted Rack _protocol_ version number as an array of integers. [`[1,3]`][8] at the time of writing.
* `rack.input`: the input stream containing the raw HTTP post data. We'll get to this later, but we'll pass an empty `StringIO` instance (with an ASCII-8BIT encoding) for now.
* `rack.errors`: the error stream for `Rack::Logger` to write to. We're using `$stderr`.
* `rack.multithread`: our server is single-threaded, so this can be set to `false`.
* `rack.multiprocess`: our server is running in a single process, so this can be set to `false` as well.
* `rack.run_once`: our server can handle multiple sequential requests in one process, so this is `false` too.
* `rack.url_scheme`: no SSL support, so this can be set to "http" instead of "https".

After adding all missing variables, `Rack::Lint` will notify us of one more problem in our environment.

```ruby    
$ ruby http_server.rb
GET / HTTP/1.1
/Users/jeff/.rbenv/versions/2.4.0/lib/ruby/gems/2.4.0/gems/rack-2.0.1/lib/rack/lint.rb:20:in `assert': env variable QUERY_STRING has non-string value nil (Rack::Lint::LintError)
        ...
        from http_server.rb:18:in `<main>'
```

When there's no query string in the request, we'll now pass `nil` as the `QUERY_STRING`, which is not allowed. In that case, Rack expects an empty string instead. After implementing the missing variables and updating the query string, this is what our environment looks like:

```ruby
# http_server.rb
# ...
  method, full_path = request.split(' ')
  path, query = full_path.split('?')

  input = StringIO.new
  input.set_encoding 'ASCII-8BIT'

  status, headers, body = app.call({
    'REQUEST_METHOD' => method,
    'PATH_INFO' => path,
    'QUERY_STRING' => query || '',
    'SERVER_NAME' => 'localhost',
    'SERVER_PORT' => '5678',
    'rack.version' => [1,3],
    'rack.input' => input,
    'rack.errors' => $stderr,
    'rack.multithread' => false,
    'rack.multiprocess' => false,
    'rack.run_once' => false,
    'rack.url_scheme' => 'http'
  })

      session.print "HTTP/1.1 #{status}rn"
    # ...
```   

Restarting our server and reloading [http://localhost:5678]({{localhost:5678}}), we're greeted with another error. This time, however, it's Rails' "something went wrong"-page, confirming that we're one step further.

![](https://github.com/Codevolve/next/blob/master/courses/community/Ruby%20Magic/assets/something-went-wrong.png?raw=true)

Looking through the Rails logs in blog/log/development.log, we'll find the exception that's causing the error:

```ruby
Started GET "/" for  at 2017-01-23 08:00:26 +0100

IPAddr::InvalidAddressError: invalid address
        ...
        from http_server.rb:18:in `<main>'
```

Besides conforming to the Rack environment specification, Rails needs the `REMOTE_ADDR` variable to be set to hold the client's IP address. Since we're only running our server locally right now, we can hardcode it to "127.0.0.1". Let's add that to our environment.

```ruby
    # http_server.rb
    # ...
      status, headers, body = app.call({
          # ...
          'SERVER_PORT' => '5678',
          'REMOTE_ADDR' => '127.0.0.1',
          'rack.version' => [1,3],
          # ...
      })
    # ...
```

Restarting the server one more time and visiting  http://localhost:5678 again, we'll be greeted with Rails' "You're on Rails!"-page, meaning we're now running an actual Rails application on our home made server!

![](https://github.com/Codevolve/next/blob/master/courses/community/Ruby%20Magic/assets/youre-on-rails.png?raw=true)

