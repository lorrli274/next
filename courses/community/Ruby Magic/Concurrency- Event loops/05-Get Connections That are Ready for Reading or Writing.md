Now lets ask the OS to inform us when a connection is ready. We pass in the keys of the `client_handlers` store for reading, writing and error handling. These keys are the socket objects we accepted in step 1. We wait for 10 milliseconds for this to happen.

```ruby 
readable, writable = IO.select(
  $client_handlers.keys,
  $client_handlers.keys,
  $client_handlers.keys,
  0.01
)
```
