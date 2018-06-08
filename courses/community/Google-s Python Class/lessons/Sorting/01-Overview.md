The easiest way to **sort** is with the `sorted(list)` function, which takes a list and returns a new list with those elements in sorted order. The original list is not changed.
    
```python    
a = [5, 1, 4, 3]
print sorted(a)  ## [1, 3, 4, 5]
print a  ## [5, 1, 4, 3]
```

It's most common to pass a list into the `sorted()` function, but in fact it can take as input any sort of iterable collection. The older `list.sort()` method is an alternative detailed below. The `sorted()` function seems easier to use compared to `sort()`, so it's recommended to use `sorted()`.

The `sorted()` function can be customized through optional arguments. The `sorted()` optional argument `reverse=True`. Example: `sorted(list, reverse=True)`, makes it sort backwards.
    
```python    
strs = ['aa', 'BB', 'zz', 'CC']
print sorted(strs)  ## ['BB', 'CC', 'aa', 'zz'] (case sensitive)
print sorted(strs, reverse=True)   ## ['zz', 'aa', 'CC', 'BB']
```
