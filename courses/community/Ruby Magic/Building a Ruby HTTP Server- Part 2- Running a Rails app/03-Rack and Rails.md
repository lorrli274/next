Ruby frameworks like **Rails** and **Sinatra** are built on top of the **Rack** interface. Just like the instance of `Rack::Lobster` we're using to test our server right now, Rails' `Rails.application` is a Rack application object. In theory, this would mean that our server should already be able to serve a Rails application.

To test that, here's a prepared simple Rails application. Let's clone that into the same directory as our server.

```ruby
$ ls
http_server.rb
$ git clone https://github.com/jeffkreeftmeijer/wups.git blog
Cloning into 'blog'...
remote: Counting objects: 162, done.
remote: Compressing objects: 100% (112/112), done.
remote: Total 162 (delta 32), reused 162 (delta 32), pack-reused 0
Receiving objects: 100% (162/162), 29.09 KiB | 0 bytes/s, done.
Resolving deltas: 100% (32/32), done.
Checking connectivity... done.
$ ls
blog           http_server.rb
```

Then, in our server, require the Rails application's environment file instead of `rack` and `rack/lobster`, and put the `Rails.application` in the `app` variable instead of `Rack::Lobster.new`.

```ruby
# http_server.rb
require 'socket'
require_relative 'blog/config/environment'

app = Rails.application
server = TCPServer.new 5678
# ...
```

Starting the server (`ruby http_server.rb`) and opening  [http://localhost:5678]({{localhost:5678}}) shows us we're not quite there yet. The server doesn't crash, but we're greeted with an internal server error in the browser.

![](https://github.com/Codevolve/next/blob/master/courses/community/Ruby%20Magic/assets/500.png?raw=true)

Checking our server's logs, we can see that we're missing something called `rack.input`. It turns out that we've been lazy while implementing our server last time, so there's more work to do before we can get this Rails application to work.

```ruby 
$ ruby http_server.rb
GET / HTTP/1.1
Error during failsafe response: Missing rack.input
  ...
  http_server.rb:15:in `<main>'
```
