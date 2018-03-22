When using **strings** in Ruby, we sometimes need to put the quote we used to define the string inside the string itself. When we do, we can escape the quote character with a backslash `` symbol.
 
```ruby    
# Escape quotes in double quoted strings
"Hello "world"!"
=> "Hello "world"!"

# Escape quotes in single quoted strings
'Hello 'world'!'
=> "Hello 'world'!"
```

Here we can see that Ruby defaults to double quoted strings for output and only escapes those double quotes in the output.
