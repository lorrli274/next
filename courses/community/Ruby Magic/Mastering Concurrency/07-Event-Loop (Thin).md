**Event-loops** are used when you need to do a lot of concurrent I/O operations. The model itself doesn't force multiple requests to be executed at the same time, but it is an efficient way to handle a lot of concurrent users.

Below you'll see a very simple event loop written in Ruby. The loop will take the event from the `event_queue` and handle it. If there is no event, it will sleep and repeat to see if there are new events in the queue.

```ruby
loop do
  if event_queue.any?
    handle_event(event_queue.pop)
  else
    sleep 0.1
  end
end
```

