**Python** is a dynamic, interpreted (bytecode-compiled) language. There are no type declarations of variables, parameters, functions, or methods in source code. This makes the code short and flexible, and you lose the compile-time type checking of the source code. Python tracks the types of all values at runtime and flags code that does not make sense as it runs. 

An excellent way to see how Python code works is to run the Python interpreter and type code right into it. If you ever have a question like, "What happens if I add an `int` to a `list`?" Just typing it into the Python interpreter is a fast and likely the best way to see what happens. (See below to see what really happens!)
    
```bash    
$ python        ## Run the Python interpreter
Python 2.7.9 (default, Dec 30 2014, 03:41:42) 
[GCC 4.1.2 20080704 (Red Hat 4.1.2-55)] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> a = 6       ## set a variable in this interpreter session
>>> a           ## entering an expression prints its value
6
>>> a + 2
8
>>> a = 'hi'    ## 'a' can hold a string just as well
>>> a
'hi'
>>> len(a)      ## call the len() function on a string
2
>>> a + len(a)  ## try something that doesn't work
Traceback (most recent call last):
  File "", line 1, in 
TypeError: cannot concatenate 'str' and 'int' objects
>>> a + str(len(a))  ## probably what you really wanted
'hi2'
>>> foo         ## try something else that doesn't work
Traceback (most recent call last):
  File "", line 1, in 
NameError: name 'foo' is not defined
>>> ^D          ## type CTRL-d to exit (CTRL-z in Windows/DOS terminal)
```    

As you can see above, it's easy to experiment with variables and operators. Also, the interpreter throws, or "raises" in Python parlance, a runtime error if the code tries to read a variable that has not been assigned a value. Like C++ and Java, Python is case sensitive so `a` and `A` are different variables. The end of a line marks the end of a statement, so unlike C++ and Java, Python does not require a semicolon at the end of each statement. Comments begin with a '#' and extend to the end of the line.
