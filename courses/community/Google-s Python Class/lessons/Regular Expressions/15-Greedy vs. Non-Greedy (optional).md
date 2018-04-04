This is optional section which shows a more advanced regular expression technique not needed for the exercises.

Suppose you have text with tags in it: `<b>foo</b> and <i>so on</i>`

Suppose you are trying to match each tag with the pattern `(<.*>)` -- what does it match first?

The result is a little surprising, but the greedy aspect of the `.*` causes it to match the whole 'foo and so on' as one big match. The problem is that the .* goes as far as is it can, instead of stopping at the first > (aka it is "greedy").

There is an extension to regular expression where you add a `?` at the end, such as `.*?` or `.+?`, changing them to be non-greedy. Now they stop as soon as they can. So the pattern `(<.*?>)` will get just '' as the first match, and '' as the second match, and so on getting each <..> pair in turn. The style is typically that you use a `.*?`, and then immediately its right look for some concrete marker (> in this case) that forces the end of the `.*?` run.

The `*?` extension originated in Perl, and regular expressions that include Perl's extensions are known as Perl Compatible Regular Expressions -- pcre. Python includes pcre support. Many command line utils etc. have a flag where they accept pcre patterns. 

An older but widely used technique to code this idea of "all of these chars except stopping at X" uses the square-bracket style. For the above you could write the pattern, but instead of `.*` to get all the chars, use `[^>]*` which skips over all characters which are not > (the leading ^ "inverts" the square bracket set, so it matches any char not in the brackets).
