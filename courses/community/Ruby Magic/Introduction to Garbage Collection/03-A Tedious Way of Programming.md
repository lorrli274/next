You might have already realized there's a risk here: what if you forget to `free` the variable? In that case the content of that variable will just stick around in memory until the process exits. If you do this often enough, you will be out of memory and your process crashes.

The next example demonstrates another common issue:

```ruby
1_000_000.times do |i|

  variable = "Variable #{i}"
  free(variable)
  puts variable
end
```

We declare the variable and `free` it. But then we try to use it again, which is impossible because it doesn't exist anymore. If this were C, your program would now crash with a `segfault`. Oops!
