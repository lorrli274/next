An **exception** represents a run-time error that halts the normal execution at a particular line and transfers control to error handling code. This section just introduces the most basic uses of exceptions. 

For example: A run-time error might be that a variable used in the program does not have a value, or a file open operation error because a file does not exist (`IOError`).

Without any error handling code, a run-time exception just halts the program with an error message. That's a good default behavior, and you've seen it many times. You can add a `try`/`except` structure to your code to handle exceptions, like this:
    
```python    
try:
  ## Either of these two lines could throw an IOError, say
  ## if the file does not exist or the read() encounters a low level error.
  f = open(filename, 'rU')
  text = f.read()
  f.close()
except IOError:
  ## Control jumps directly to here if any of the above lines throws IOError.
  sys.stderr.write('problem reading:' + filename)
## In any case, the code then continues with the line after the try/except
```

info> The `try:` section includes the code which might throw an exception. The `except:` section holds the code to run if there is an exception. If there is no exception, the `except:` section is skipped. You can get a pointer to the exception object itself with syntax `except IOError as e: ..` (`e` points to the exception object). 

