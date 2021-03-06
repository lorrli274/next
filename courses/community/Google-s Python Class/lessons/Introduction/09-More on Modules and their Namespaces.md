Suppose you've got a module `binky.py` which contains a `def foo()`. The fully qualified name of that `foo` function is `binky.foo`. In this way, various Python **modules** can name their functions and variables whatever they want, and the variable names won't conflict. `module1.foo` is different from `module2.foo` and so on.

info> In the Python vocabulary, we'd say that `binky`, `module1`, and `module2` each have their own `namespaces`, which are variable name-to-object bindings.

For example, we have the standard `sys` module that contains some standard system facilities, like the `argv list`, and `exit()` function. With the statement `import sys` you can then access the definitions in the `sys` module and make them available by their fully qualified name. For example `sys.exit()`.

```python    
import sys

# Now can refer to sys.xxx facilities
sys.exit(0) # exit with a status code of 0
```

There is another import form that looks like this: `from sys import argv, exit`. That makes `argv` and `exit()` available by their short names. It's recommended to use the original form with the fully-qualified names because it's a lot easier to determine where a function or attribute came from.

There are many modules and packages which are bundled with a standard installation of the Python interpreter, so you don't have to do anything extra to use them. These are collectively known as the **Python Standard Library**. Commonly used modules/packages include:

* `sys`: Access to `exit()`, `argv`, `stdin`, `stdout`, etc 

* `re`: Regular expressions 

* `os`: Operating system interface, file system

info> You can find the documentation of all the Standard Library modules and packages [here](https://docs.python.org/3/library/).
