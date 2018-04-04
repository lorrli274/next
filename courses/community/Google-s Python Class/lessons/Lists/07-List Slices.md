**Slices** work on lists just as with strings, and can also be used to change sub-parts of the list.
    
```python    
list = ['a', 'b', 'c', 'd']
print list[1:-1]   ## ['b', 'c']
list[0:2] = 'z'    ## replace ['a', 'b'] with ['z']
print list         ## ['z', 'c', 'd']
```
