Python has the standard **`while`-loop**, and the **`break`** and **`continue`** statements work as in C++ and Java, altering the course of the innermost loop. The previous **for** and **in** loops we worked with solves the common case of iterating over every element in a list, but the while loop gives you total control over the index numbers. 

Here's a `while` loop which accesses every 3rd element in a list:
```python    
## Access every 3rd element in a list
i = 0
while i < len(a):
  print a[i]
  i = i + 3
```
