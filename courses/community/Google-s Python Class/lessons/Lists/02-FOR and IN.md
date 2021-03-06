Python's **`for`** and **`in`** constructs are extremely useful, and the first use of them we'll see is with lists. The `for` construct `for var in list` is an easy way to look at each element in a list (or other collection).

warning> Make sure you do not add or remove from the list during iteration.
    

```python    
squares = [1, 4, 9, 16]
sum = 0
for num in squares:
  sum += num
print sum  ## 30
```

If you know what sort of thing is in the list, use a variable name in the loop that captures that information such as `num`, `name`, or `url`. Since Python code does not have other syntax to remind you of types, your variable names are a key way for you to keep straight what is going on.

The **`in`** construct on its own is an easy way to test if an element appears in a list (or other collection). `value in collection` tests if the value is in the collection, returning `True`/`False`.
    
```python    
list = ['larry', 'curly', 'moe']
if 'curly' in list:
  print 'yay'
```

The `for` and `in` constructs are very commonly used in Python code and work on data types other than list, so you should just memorize their syntax.

info> You can also use `for` and `in` to work on a string. The string acts like a list of its chars, so `for ch in s: print ch` prints all the chars in a string.
