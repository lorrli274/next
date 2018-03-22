**Escaping characters** also works in **regular expressions**. In regular expressions many characters represent more than just their literal definition.

The `.` is a wild card for any character, brackets `[]` represent a range or a selection, parenthesis `()` match an expression, etc. To use their literal definitions we can also escape them with the backslash symbol.

```ruby
/Hello [world]/
=> /Hello [world]/

/[world]/ =~ "Hello [world]"
=> 6
```

If we didn't escape the brackets, it would instead look for any of the characters between the brackets and find the first match in the character `l` in "Hello" on position 3.

```ruby
/[world]/ =~ "Hello [world]"
=> 2 # zero index
```

To avoid having to escape the forward slash symbol `/`, used to define the regular expression, we can use another percent notation.

```ruby
%r{/world/}
=> //world//
```

Using `%r{}` we can define a regular expression where we don't have to escape the forward slash. In the result we can see that Ruby escapes the forward slash for us.
