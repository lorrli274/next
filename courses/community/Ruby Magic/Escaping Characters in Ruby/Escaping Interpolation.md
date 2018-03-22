Ruby supports **interpolation** inside strings. But once again, not all string definitions are created equal. Interpolation only works in double quoted strings.

In the code example below we see that interpolation works in a double quoted string, but that Ruby escapes the interpolation sequence in a single quoted string, rendering it useless.

```ruby
name = "world"

"Hello #{name}"
=> "Hello world"

'Hello #{name}'
=> "Hello #{name}"
```

This behavior applies to almost every kind of string "magic". Double quotes support it, single quotes don't.
