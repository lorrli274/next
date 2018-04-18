The outermost statements in a Python file (or Module) do its one-time setup. Those statements run from top to bottom the first time the module is imported somewhere, which setup its variables and functions. 

A Python module can be run directly, or it can be imported and used by some other module. When a Python file is run directly, the special variable **name** is set to **main**. It's common to have the boilerplate `if namem ==...` shown above to call a `main()` function when the module is run directly, but not when the module is imported by some other module.

In a standard Python program, the list `sys.argv` contains the command-line arguments in the standard way with sys.argv[0] being the program itself, `sys.argv[1]` the first argument, and so on. 

If you know about `argc`, or the number of arguments, you can simply request this value from Python with `len(sys.argv)`, just like we did in the interactive interpreter code above when requesting the length of a string. In general, `len()` can tell you how long a string is, the number of elements in lists and tuples, and the number of key-value pairs in a dictionary.
