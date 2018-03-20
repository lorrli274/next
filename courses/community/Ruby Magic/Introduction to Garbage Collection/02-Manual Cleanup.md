Back in the day, scripting languages such as Ruby did not exist yet. People only wrote code in languages such as C, a low level programming language. One of the things that makes these languages low level is that you have to clean up after yourself. For example, whenever you allocate memory to store a `String`, you also have to decide when to clean it up.

This looks a little something like the following mock Ruby code. It declares a variable and uses the method `free` –this method does not actually exist in Ruby– to clean up the memory we've used after we're done with the variable.

```ruby
1_000_000.times do |i|

variable = "Variable #{i}"
puts variable
free(variable)
end
```
