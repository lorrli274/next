Escaping the line ending also works for things like **string definitions**. Normally if we have a multi-line string we can use the plus symbol `+` to combine the strings on the two lines.

```ruby   
"foo" +
  "bar"
=> "foobar"
```

This creates two strings on two lines and then combines as one. So it really creates three string objects.

Instead of using a plus symbol, we can escape the line break with a backslash again.

```ruby  
"foo" 
  "bar"
=> "foobar"
```

The result is the same, or is it?

In the first example we're actually combining two new strings, while in the second example Ruby will only create one. The Ruby interpreter will see the backslash `` as a continuation of the string definition and only create one string based on the two lines. So it's even better for your app's memory usage.
