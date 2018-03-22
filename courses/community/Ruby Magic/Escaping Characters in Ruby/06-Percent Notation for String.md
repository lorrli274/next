The **percent notation** in Ruby is something inspired by the Perl programming language and gives us many shorthands for some common type definitions.

The same behavior for single and double quoted strings applies to the percent notation as well.

* `%()` and `%Q()` behave the same way as a double quoted string.
* `%q()` behaves the same way as a single quoted string.

The problem with the percent notation is that you now need to escape the parenthesis characters `()` instead of the quotes when the parenthesis aren't balanced.

Which is why Ruby allows you to use other symbols for the percent notation as well: `%[foo]`, `%{foo}`, `%-foo-`, `%?foo?`, etc. It even supports `%"foo"` and `%'foo'`.

Here we see that Ruby escapes the string for us when using the percent notation.

```ruby    
%(Hello "world"!)
=> "Hello "world""

# With unbalanced parenthesis
%(Hello world)!)
=> "Hello world)!"

# With balanced parenthesis
%(Hello (world)!)
=> "Hello (world)!"
```    

Again, the same rules apply here as with normal single and double quoted strings. Escape sequences and interpolation are escaped by default in single quoted strings.

```ruby    
name = "world"

%(Hellon "#{name}"!)
=> "Hellon "world"!"

%q(Hellon "#{name}"!)
=> "Hello
"#{name}"!"

%Q(Hellon "#{name}"!)
=> "Hellon "world"!"
```
