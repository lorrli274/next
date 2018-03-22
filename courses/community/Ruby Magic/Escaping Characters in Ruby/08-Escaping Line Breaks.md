Previously we escaped the "newline" escape sequence `n` in a string in Ruby. Did you know you can also escape a **line break** in Ruby itself?

For example, we have a very long line for a method call and this breaks our code style guide's max line length.

```ruby
ruby_method_with_many_arguments "Hello world", split: " ", join: "n"
```

We can place the arguments on separate lines to make each individual line shorter. This works as long as the previous line ends with a comma `,`, operators like the plus symbol `+`, or is part of a method call wrapped in parenthesis `()`.

```ruby
ruby_method_with_many_arguments "Hello world",
  split: " ",
  join: "n"

ruby_method_with_many_arguments(
  "Hello world",
  split: " ",
  join: "n"
)
```   

If instead we'd want to align all arguments on the same indentation level without wrapping it in parenthesis `()` we can use a backslash `` to escape the line break.

```ruby
ruby_method_with_many_arguments 
  my_string,
  split: " ",
  join: "n"
```

What we do here is not really telling Ruby to escape the newline, but that the statement will continue on the next line.
