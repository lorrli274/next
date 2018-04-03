Here are some other common list methods.

* `list.append(elem)` -- adds a single element to the end of the list. Common error: does not return the new list, just modifies the original.

* `list.insert(index, elem)` -- inserts the element at the given index, shifting elements to the right.

* `list.extend(list2)` adds the elements in list2 to the end of the list. Using + or += on a list is similar to using `extend()`.

* `list.index(elem)` -- searches for the given element from the start of the list and returns its index. Throws a `ValueError` if the element does not appear (use "in" to check without a `ValueError`).

* `list.remove(elem)` -- searches for the first instance of the given element and removes it (throws `ValueError` if not present)

* `list.sort()` -- sorts the list in place (does not return it). (The `sorted()` function shown below is preferred.)

* `list.reverse()` -- reverses the list in place (does not return it)

* `list.pop(index)` -- removes and returns the element at the given index. Returns the rightmost element if index is omitted (roughly the opposite of `append()`).

Notice that these are *methods* on a list object, while `len()` is a function that takes the list (or string or whatever) as an argument.
    
```python    
list = ['larry', 'curly', 'moe']
list.append('shemp')         ## append elem at end
list.insert(0, 'xxx')        ## insert elem at index 0
list.extend(['yyy', 'zzz'])  ## add list of elems at end
print list  ## ['xxx', 'larry', 'curly', 'moe', 'shemp', 'yyy', 'zzz']
print list.index('curly')    ## 2

list.remove('curly')         ## search and remove that element
list.pop(1)                  ## removes and returns 'larry'
print list  ## ['xxx', 'moe', 'shemp', 'yyy', 'zzz']
```

Common error: note that the above methods do not return the modified list, they just modify the original list.
    
```python    
list = [1, 2, 3]
print list.append(4)   ## NO, does not work, append() returns None
## Correct pattern:
list.append(4)
print list  ## [1, 2, 3, 4]
```
