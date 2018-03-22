The difference between **single** and **double quoted** strings in Ruby is the way the string definitions represent escape sequences.

* In double quoted strings, you can write escape sequences and Ruby will output their translated meaning. A `n` becomes a newline.
* In single quoted strings however, escape sequences are escaped and return their literal definition. A `n` remains a `n`.

Both string types have their use cases of course. It's likely you'll use double quoted strings with escape sequences to use their translated meaning, a newline or a tab.

Single quotes are useful for avoiding escaping escape sequences themselves. Useful for demonstrating their usage or avoiding accidentally using escape sequences you didn't intent to.

```ruby
puts "Line 1nLine 2"
=> Line 1
Line 2

puts 'Using a n we can indicate a newline.'
=> Using a n we can indicate a newline.
```
