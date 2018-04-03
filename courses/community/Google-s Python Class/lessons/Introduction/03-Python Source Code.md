Python source files use the ".py" extension and are called "modules." With a Python module `hello.py`, the easiest way to run it is with the shell command "python hello.py Alice" which calls the Python interpreter to execute the code in `hello.py`, passing it the command line argument "Alice". See the [official docs page](http://docs.python.org/using/cmdline) on all the different options you have when running Python from the command-line. 

Here's a very simple `hello.py` program (notice that blocks of code are delimited strictly using indentation rather than curly braces — more on this later!):
    
```python    
#!/usr/bin/env python

# import modules used here -- sys is a very standard one
import sys

# Gather our code in a main() function
def main():
    print 'Hello there', sys.argv[1]
    # Command line args are in sys.argv[1], sys.argv[2] ...
    # sys.argv[0] is the script name itself and can be ignored

# Standard boilerplate to call the main() function to begin
# the program.
if __name__ == '__main__':
    main()
```    

Running this program from the command line looks like:
    
```bash    
$ python hello.py Guido
Hello there Guido
$ ./hello.py Alice  ## without needing 'python' first (Unix)
Hello there Alice
```    
