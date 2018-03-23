If any of our connections are writable, we'll trigger the client handlers and resume them with a `writable` state.

```ruby
if writable
  writable.each do |ready_socket|
    # Get the client from storage
    client = $client_handlers[ready_socket]
    next unless client

    client.resume(:writable)
  end
end
```

By using these four steps in a loop which creates handlers, and calling `readable` and `writable` on these handlers at the right time, we have created a fully functional evented chat server. There's very little overhead per connection, and we could scale this up to a large number of concurrent clients.

This approach works very well as long as we keep the amount of work per tick of the loop small. This is especially important for work that involves calculations, since an event loop runs in a single thread and thus can only utilize a single CPU. In production systems there are often multiple processes running an event loop to work around this limitation.
