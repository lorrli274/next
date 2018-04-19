As an alternative to `sorted()`, the `sort()` method on a list sorts that list into ascending order. Example: `list.sort()`. The `**sort()**` method changes the underlying list and returns None, so use it like this:
    
```python    
alist.sort()            ## correct
alist = blist.sort()    ## NO incorrect, sort() returns None
```

The above is a very common misunderstanding with `sort()`, because it does not return the sorted list. 

The `sort()` method must be called on a list; it does not work on any enumerable collection (just remember the `sorted()` function above works on anything). The `sort()` method predates the `sorted()` function, so you will likely see it in older code. The `sort()` method does not need to create a new list, so it can be a little faster in the case that the elements to sort are already in a list.
