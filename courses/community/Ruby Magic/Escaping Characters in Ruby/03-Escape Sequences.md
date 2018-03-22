Besides quotes, there are more symbols we can **escape** in strings. For example, a newline is represented by `n`. This is called an **"escape sequence"**.

```ruby
"Hellonworld"
=> "Hellonworld"
```

What gets returned is the same string as we created, but as you can see the `n` is highlighted, indicating it's an escape sequence. If we would now print this string we see that the literal `n` is not printed, but an actual newline is printed instead.

```ruby  
puts "Hellonworld"
=> Hello
world
```

This doesn't work in single quoted strings. The `n` sequence is interpreted as a literal `n`. In double quoted strings you would have to escape the backslash symbol to accomplish the same result.

Examples of other escape sequences that work the same way are: `t`, `s` and `b`, which represent a tab, a space and a backspace respectively.
