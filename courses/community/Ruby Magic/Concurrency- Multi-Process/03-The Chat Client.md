This step focuses on the chat server, but to communicate with it we'll need a chat client first. The following code will be our very simple client.

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

The client opens a TCP connection to a server running on port 2000. When connected, it spawns a thread that will `puts` anything the server sends, so the chat is visible in the terminal output. Finally, there's a while loop that sends any line you type to the server, which it will send to all other connected clients.
