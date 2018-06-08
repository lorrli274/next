Python has a great built-in list type named **list**. List **literals** are written within square brackets `[ ]`. Lists work similarly to strings. They use the `len()` function and square brackets `[ ]` to access data, with the first element at index 0.
    
```python    
colors = ['red', 'blue', 'green']
print colors[0]    ## red
print colors[2]    ## green
print len(colors)  ## 3
```

![](https://github.com/Codevolve/next/blob/master/courses/community/Google-s%20Python%20Class/Assets/list02.png?raw=true)

Assignment with an `=` on lists does not make a copy. Instead, assignment makes the two variables point to the one list in memory. 
    
```python   
b = colors   ## Does not copy the list
```

![](https://github.com/Codevolve/next/blob/master/courses/community/Google-s%20Python%20Class/Assets/list03.png?raw=true)

The empty list is just an empty pair of brackets `[ ]`. The `+` works to append two lists, so `[1, 2] + [3, 4]` yields `[1, 2, 3, 4]`. This is just like `+` with strings.

