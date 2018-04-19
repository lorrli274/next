**List comprehensions** are a more advanced feature which is nice for some cases but is not needed for the exercises and is not something you need to learn at first, but we're going to run through it anyways. A list comprehension is a compact way to write an expression that expands to a whole list. Suppose we have a list nums `[1, 2, 3, 4]`, here is the list comprehension to compute a list of their squares `[1, 4, 9, 16]`:
    
```python    
nums = [1, 2, 3, 4]

squares = [ n * n for n in nums ]   ## [1, 4, 9, 16]
```

The syntax is `[ expr for var in list ]` the `for var in list` looks like a regular for-loop, but without the colon `:`. The `expr` to its left is evaluated once for each element to give the values for the new list. Here is an example with strings, where each string is changed to upper case with `!!!` appended:

    
```python    
strs = ['hello', 'and', 'goodbye']

shouting = [ s.upper() + '!!!' for s in strs ]
## ['HELLO!!!', 'AND!!!', 'GOODBYE!!!']
```

You can add an `if` test to the right of the for-loop to narrow the result. The `if` test is evaluated for each element, including only the elements where the test is true.

```python
## Select values <= 2
nums = [2, 8, 1, 6]
small = [ n for n in nums if n <= 2 ]  ## [2, 1]

## Select fruits containing 'a', change to upper case
fruits = ['apple', 'cherry', 'bannana', 'lemon']
afruits = [ s.upper() for s in fruits if 'a' in s ]
## ['APPLE', 'BANNANA']
```
