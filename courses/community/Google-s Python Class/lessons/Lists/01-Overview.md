Python has a great built-in list type named "list". List literals are written within square brackets [ ]. Lists work similarly to strings -- use the len() function and square brackets [ ] to access data, with the first element at index 0. (See the official [python.org list docs][1].)
    
```    
colors = ['red', 'blue', 'green']
print colors[0]    ## red
print colors[2]    ## green
print len(colors)  ## 3
```

![list of strings 'red' 'blue 'green'][2]

Assignment with an = on lists does not make a copy. Instead, assignment makes the two variables point to the one list in memory. 
    
```   
b = colors   ## Does not copy the list
```

![both colors and b point to the one list][3]

The "empty list" is just an empty pair of brackets [ ]. The '+' works to append two lists, so [1, 2] + [3, 4] yields [1, 2, 3, 4] (this is just like + with strings).

