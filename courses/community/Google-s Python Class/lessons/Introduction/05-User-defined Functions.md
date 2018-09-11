**Functions** in Python are defined like this:
    
```python    
# Defines a "repeat" function that takes 2 arguments.
def repeat(s, exclaim):
    """
    Returns the string 's' repeated 3 times.
    If exclaim is true, add exclamation marks.
    """

    result = s + s + s # can also use "s * 3" which is faster (Why?)
    if exclaim:
        result = result + '!!!'
    return result
```

Notice how the lines that make up the function or if-statement are grouped by all having the same level of indentation. We also presented 2 different ways to repeat strings, using the `+` operator which is more user-friendly, but `*` also works because it's Python's **repeat** operator. This means that `'-' * 10` gives `'----------'` a neat way to create an on-screen line. 

In the code comment above we hinted that `*` works faster than `+`. The reason being that `*` calculates the size of the resulting object once. Whereas with `+`, that calculation is made each time `+` is called. 

Both `+` and `*` are called **overloaded** operators because they mean different things for numbers vs. for strings (and other data types).

The `def` keyword defines the function with its parameters within parentheses and its code indented. The first line of a function can be a documentation string (`docstring`) that describes what the function does. The docstring can be a single line, or a multi-line description as in the example above.

Variables defined in the function are local to that function, so the `result` in the above function is separate from a `result` variable in another function. The `return` statement can take an argument, in which case that is the value returned to the caller.

Here is code that calls the above `repeat()` function, printing what it returns:
```python    
def main():
    print repeat('Yay', False)      ## YayYayYay
    print repeat('Woo Hoo', True)   ## Woo HooWoo HooWoo Hoo!!!
```

At run time, functions must be defined by the execution of a `def` before they are called. It's typical to `def` a `main()` function towards the bottom of the file with the functions it calls above it.
