Python has a built-in string class named `str` with many handy features. There is an older module named `string` which you should not use. String literals can be enclosed by either double or single quotes, although single quotes are more commonly used. **Backslash** escapes work the usual way within both single and double quoted literals -- e.g. `n ' "`. 

A double quoted string literal can contain single quotes without any fuss. Single quoted string can contain double quotes as well. A string literal can span multiple lines, but there must be a backslash at the end of each line to escape the newline. String literals inside triple quotes `""""` or `'''` can span multiple lines of text.

Python strings are **immutable**, which means they cannot be changed after they are created. Since strings can't be changed, we construct new strings as we go to represent computed values. So for example the expression `'hello' + 'there'` takes in the 2 strings `'hello'` and `'there'` and builds a new string `'hellothere'`.

Characters in a string can be accessed using the standard `[]` syntax and uses zero-based indexing. So if `str` is `hello` then `str[1]` is `e`. If the index is out of bounds for the string, Python raises an error. The Python style is to halt if it can't tell what to do, rather than just make up a default value. 

The handy **slice** syntax also works to extract any substring from a string. The `len(string)` function returns the length of a string. The `[]` syntax and the `len()` function actually work on any sequence type like strings, lists, and so on. 

Python tries to make its operations work consistently across different types. Don't use `len` as a variable name to avoid blocking out the `len()` function. The `+` operator can concatenate two strings. Notice in the code below that variables are not pre-declared, just assign to them and go.

```python
s = 'hi'
print (s[1])          ## i
print (len(s))        ## 2
print (s + ' there')  ## hi there
```

The `+` does not automatically convert numbers or other types to string form. The `str()` function converts values to a string form so they can be combined with other strings.
    
```python   
pi = 3.14
##text = 'The value of pi is ' + pi      ## NO, does not work
text = 'The value of pi is '  + str(pi)  ## yes
```

For numbers, the standard operators, `+`, `/`, and `*` work in the usual way. There is no `++` operator, but `+=`, `-=`, etc. work. If you want integer division, it is most correct to use 2 slashes. Example: `6 // 5` is 1.

The `print` operator prints out one or more python items followed by a newline. Leave a trailing comma at the end of the items to inhibit the newline. 

A **raw** string literal is prefixed by an `r` and passes all the chars through without special treatment of backslashes, so `r'x\nx'` evaluates to the length-4 string `x\nx`. A `u` prefix allows you to write a unicode string literal.

```python
raw = r'this\t\n and that'
print (raw)     ## this\t\n and that

multi = """It was the best of times.
It was the worst of times."""
```
