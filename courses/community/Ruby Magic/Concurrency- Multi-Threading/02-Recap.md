To remind you quickly: this is what our chat system looks like:

![Chat example](https://github.com/Codevolve/next/blob/master/courses/community/Ruby%20Magic/assets/chat_example.png?raw=true)

We're using the same client we used earlier:

```ruby
# client.rb
# $ ruby client.rb
require 'socket'
client = TCPSocket.open(ARGV[0], 2000)

Thread.new do
  while line = client.gets
    puts line.chop
  end
end

while input = STDIN.gets.chomp
  client.puts input
end
``` 

The basic setup for the server is the same:

```ruby
# server_threads.rb
# $ ruby server_threads.rb
require 'socket'

puts 'Starting server on port 2000'

server = TCPServer.open(2000)
 ```   
