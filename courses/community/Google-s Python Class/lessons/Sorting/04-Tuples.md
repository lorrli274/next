A **tuple** is a fixed size grouping of elements, such as an (x, y) co-ordinate. Tuples are like lists, except they are immutable and do not change size (`tuples` are not strictly immutable since one of the contained elements could be mutable). Tuples play a sort of "struct" role in Python -- a convenient way to pass around a little logical, fixed size bundle of values. A function that needs to return multiple values can just return a tuple of the values. For example, if I wanted to have a list of 3-d coordinates, the natural python representation would be a list of tuples, where each tuple is size 3 holding one (x, y, z) group.

To create a `tuple`, just list the values within parenthesis separated by commas. The "empty" `tuple` is just an empty pair of parenthesis. Accessing the elements in a `tuple` is just like a list -- `len()`, [ ], for, in, etc. all work the same.
    
```python    
tuple = (1, 2, 'hi')
print len(tuple)  ## 3
print tuple[2]    ## hi
tuple[2] = 'bye'  ## NO, tuples cannot be changed
tuple = (1, 2, 'bye')  ## this works
```
To create a `size-1 tuple`, the lone element must be followed by a comma.
    
``` python   
tuple = ('hi',)   ## size-1 tuple
```

It's a funny case in the syntax, but the comma is necessary to distinguish the tuple from the ordinary case of putting an expression in parentheses. In some cases you can omit the parenthesis and Python will see from the commas that you intend a `tuple`.

Assigning a `tuple` to an identically sized `tuple` of variable names assigns all the corresponding values. If the `tuples` are not the same size, it throws an error. This feature works for lists too.
    
```python    
(x, y, z) = (42, 13, "hike")
print z  ## hike
(err_string, err_code) = Foo()  ## Foo() returns a length-2 tuple
```
