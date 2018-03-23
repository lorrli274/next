If any of our connections are readable, we'll trigger the client handlers and resume them with a `readable` state. We can look up these client handlers because the `Socket` object that is returned by `IO.select` is used as the key of the handlers store.

```ruby    
if readable
  readable.each do |ready_socket|
    # Get the client from storage
    client = $client_handlers[ready_socket]

    client.resume(:readable)
  end
end
```
