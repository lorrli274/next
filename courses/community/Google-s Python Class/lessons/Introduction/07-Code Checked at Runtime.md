Python does very little checking at compile time. This defers almost all type, name, etc. checks on each line until that line runs. Suppose the `main()` calls `repeat()` like this:
    
```python   
def main():
    if name == 'Guido':
        print repeeeet(name) + '!!!'
    else:
        print repeat(name)
```    

The if-statement contains an obvious error, where the `repeat()` function is accidentally typed in as `repeeeet()`. The funny fact in Python is that the above code compiles and runs fine, so long as the name at runtime is not 'Guido'. Only when a run actually tries to execute the `repeeeet()` will it notice that there is no such function and raise an error. 

This just means that when you first run a Python program, some of the first errors you see will be simple typos like this. This is one area where languages with a more verbose type system, like Java, have an advantage. They can catch such errors at compile time.
