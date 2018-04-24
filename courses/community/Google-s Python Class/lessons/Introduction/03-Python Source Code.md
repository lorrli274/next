Python source files use the _.py_ extension and are called **modules**. With a Python module *hello.py*, the easiest way to run it is with the shell command like `python hello.py Alice`. This calls the Python interpreter to execute the code in *hello.py*, passing the command line argument `Alice`. 

info> Incase you're curious, checkout the [official Python docs page](http://docs.python.org/using/cmdline) to see all the different options you have when running Python from the command-line. 

Here's a very simple `hello.py` program:
    
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

Running this program from the command line looks like this:
    
```bash    
$ python hello.py Guido
Hello there Guido
$ ./hello.py Alice  ## without needing 'python' first (Unix)
Hello there Alice
```    
