The **route** paths define the endpoints at which requests can be made. The examples we've seen so far have just been strings, and are used exactly as written: '/', '/about', '/book', '/any-random.path'.

Route paths can also be string patterns. String patterns use a subset of regular expression syntax to define _patterns_ of endpoints that will be matched. The subset is listed below (note that the hyphen (`-`) and the dot (`.`) are interpreted literally by string-based paths):

* ? : The endpoint must have 0 or 1 of the preceding character. E.g. a route path of `'/ab?cd'` will match endpoints `acd` or `abcd`.
* \+ : The endpoint must have 1 or more of the preceding character. E.g. a route path of `'/ab+cd'` will match endpoints `abcd`, `abbcd`, `abbbcd`, and so on.
* * : The endpoint may have an arbitrary string where the * character is placed. E.g. a route path of `'ab*cd'` will match endpoints `abcd`, `abXcd`, `abSOMErandomTEXTcd`, and so on.
* () : Grouping match on a set of characters to perform another operation on. E.g. `'/ab(cd)?e'` will peform a ? match on (cd) —it will match `abe`, `abcde`, `abcdcde`, and so on.

The route paths can also be JavaScript regular expressions. For example, the route path below will match `catfish `and `dogfish`, but not `catflap`, `catfishhead`, and so on. Note that the path for a regular expression uses regular expression syntax (it is not a quoted string as in the previous cases).
    
```js  
app.get(/.*fish$/, function (req, res) {
	...
})
```

Most of our routes for the LocalLibrary will simply use strings and not string patterns and regular expressions. We'll also use route parameters as discussed in the next section.
