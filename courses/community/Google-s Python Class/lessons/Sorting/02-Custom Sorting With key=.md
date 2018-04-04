For more complex custom sorting, `sorted()` takes an optional "key=" specifying a "key" function that transforms each element before comparison. The key function takes in 1 value and returns 1 value, and the returned "proxy" value is used for the comparisons within the sort.

For example with a list of strings, specifying key=len (the built in `len()` function) sorts the strings by length, from shortest to longest. The sort calls `len()` for each string to get the list of proxy length values, and then sorts with those proxy values.
    
```python    
strs = ['ccc', 'aaaa', 'd', 'bb']
print sorted(strs, key=len)  ## ['d', 'bb', 'ccc', 'aaaa']
```

![calling sorted with key=len](https://developers.google.com/edu/python/images/sorted-key.png)

As another example, specifying "str.lower" as the key function is a way to force the sorting to treat uppercase and lowercase the same:
    
```python    
## "key" argument specifying str.lower function to use for sorting
print sorted(strs, key=str.lower)  ## ['aa', 'BB', 'CC', 'zz']
```

You can also pass in your own MyFn as the key function, like this:
    
```python    
## Say we have a list of strings we want to sort by the last letter of the string.
strs = ['xc', 'zb', 'yd' ,'wa']

## Write a little function that takes a string, and returns its last letter.
## This will be the key function (takes in 1 value, returns 1 value).
def MyFn(s):
  return s[-1]

## Now pass key=MyFn to sorted() to sort by the last letter:
print sorted(strs, key=MyFn)  ## ['wa', 'zb', 'xc', 'yd']
```

To use key= custom sorting, remember that you provide a function that takes one value and returns the proxy value to guide the sorting. There is also an optional argument "cmp=cmpFn" to `sorted()` that specifies a traditional two-argument comparison function that takes two values from the list and returns negative/0/positive to indicate their ordering. The built in comparison function for strings, ints, ... is cmp(a, b), so often you want to call `cmp()` in your custom comparator. The newer one argument key= sorting is generally preferable.
