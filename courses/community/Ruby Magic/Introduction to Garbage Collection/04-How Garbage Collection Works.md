Humans are notoriously bad at not making these kinds of mistakes all of the time. Hence the need for a way to automatically clean up memory. The most popular way to do this is **Garbage Collection** (**GC**). In a language that uses GC, you can create objects without manually cleaning them up. Whenever you create an object, it's registered with the Garbage Collector. GC tries to keep track of all references you make to this object. When it determines you're not using the object any more, it is marked for cleanup. Every once in a while the Garbage Collector pauses your program and cleans up all the marked objects.

In the simple loop we used earlier the GC's job is fairly easy. With every iteration of the loop, the variable isn't used anywhere anymore. The variable can immediately be marked for cleanup.

```ruby
1_000_000.times do |i|

variable = "Variable #{i}"
puts variable
end
```

In the next example we pass the variable into the `puts_later` method which waits for 30 seconds and then `puts` the variable.

```ruby
def puts_later(variable)
Thread.new do
  sleep 30
  puts variable
end
end

1_000_000.times do |i|
variable = "Variable #{i}"
puts_later variable
end
``` 

The Garbage Collector's job is already pretty complicated in this relatively simple example. It has to understand that we reference the variable in the `puts_later` method. Because the method starts a thread, the Garbage Collector has to keep track of the thread and wait for it to finish. Only then can the variable can be marked for cleanup.
