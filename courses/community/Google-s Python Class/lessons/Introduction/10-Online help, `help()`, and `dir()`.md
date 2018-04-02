There are a variety of ways to get help for Python.

* Do a Google search, starting with the word "python", like "python list" or "python string lowercase". The first hit is often the answer. This technique seems to work better for Python than it does for other languages for some reason.
* The official Python docs site — [docs.python.org][13] — has high quality docs. Nonetheless, I often find a Google search of a couple words to be quicker.
* There is also an [official Tutor mailing list][14] specifically designed for those who are new to Python and/or programming!
* Many questions (and answers) can be found on [StackOverflow][15] and [Quora][16].
* Use the help() and dir() functions (see below).

Inside the Python interpreter, the help() function pulls up documentation strings for various modules, functions, and methods. These doc strings are similar to Java's javadoc. The dir() function tells you what the attributes of an object are. Below are some ways to call help() and dir() from the interpreter: 

* `help(len)` — help string for the built-in `len()` function; note that it's "len" not "len()", which is a **call** to the function, which we don't want
* `help(sys)` — help string for the `sys` module (must do an `import sys` first)
* `dir(sys)` — `dir()` is like `help()` but just gives a quick list of its defined symbols, or "attributes"
* `help(sys.exit)` — help string for the `exit()` function in the `sys` module
* `help('xyz'.split)` — help string for the `split()` method for string objects. You can call `help()` with that object itself or an **example** of that object, plus its attribute. For example, calling `help('xyz'.split)` is the same as calling `help(str.split)`.
* `help(list)` — help string for `list` objects
* `dir(list)` — displays `list` object attributes, including its methods
* `help(list.append)` — help string for the `append()` method for `list` objects
