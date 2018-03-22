To handle these two scenarions with a multi-process chat server, we will be spawning a process per client connection. This process will handle all the messages being sent and received for that client. We can create these processes by forking the original server process.

info>When you call the fork method, it creates a copy of the current process with the exact same state that the process is in.

A forked process has its own process id, and will be visible separately in a tool like `top` or Activity Monitor. That looks something like this:

![](https://raw.githubusercontent.com/Codevolve/next/master/courses/community/Ruby%20Magic/assets/multi-process.svg?sanitize=true)

The process you start with is called the master process, and the processes that are forked out of the master process are called worker processes.

Since these newly forked worker processes are truly separate processes, we cannot share memory between them and the master process. We need something to communicate between them.

In the following example we set up a pipe in Ruby –with a reading and a writing end– and we `fork` the master process. The code within the block that's passed to `fork` is running in the forked process. The original process continues after this block. We then write a message to the original process from the forked one.

```ruby
reader, writer = IO.pipe

fork do
  # This is running in the forked process.
  writer.puts 'Hello from the forked process'
end

# This is running in the original process, it will puts the
# message from the forked process.
puts reader.gets
```

Using pipes we can communicate between separate processes even though the processes are completely isolated from each other.

First we set up an array to keep track of the pipes for all clients and their "writers" (the writing end of the pipe), so we can communicate with the clients. Then we make sure that all incoming messages from the clients are sent to all the other clients.

```ruby  
client_writers = []
master_reader, master_writer = IO.pipe

write_incoming_messages_to_child_processes(master_reader, client_writers)
```
