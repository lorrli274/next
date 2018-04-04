The `del` operator does deletions. In the simplest case, it can remove the definition of a variable, as if that variable had not been defined. `Del` can also be used on list elements or slices to delete that part of the list and to delete entries from a dictionary.
    
```python    
var = 6
del var  # var no more!

list = ['a', 'b', 'c', 'd']
del list[0]     ## Delete first element
del list[-2:]   ## Delete last two elements
print list      ## ['b']

dict = {'a':1, 'b':2, 'c':3}
del dict['b']   ## Delete 'b' entry
print dict      ## {'a':1, 'c':3}
```
