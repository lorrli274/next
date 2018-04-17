Some smaller changes made to the core Python language are:

* A `global` or `nonlocal` statement must now textually appear before the first use of the affected name in the same scope. Previously this was a `SyntaxWarning`.

* It is now possible to set a [special method](https://docs.python.org/3/reference/datamodel.html#specialnames) to `None` to indicate that the corresponding operation is not available. For example, if a class sets [`__iter__()`](https://docs.python.org/3/reference/datamodel.html#object.__iter__) to `None`, the class is not iterable. 

* Long sequences of repeated traceback lines are now abbreviated as `"[Previous line repeated {count} more times]"` (see [traceback](https://docs.python.org/3/whatsnew/3.6.html#whatsnew36-traceback) for an example). 

* Import now raises the new exception [`ModuleNotFoundError`](https://docs.python.org/3/library/exceptions.html#ModuleNotFoundError) (subclass of [`ImportError`](https://docs.python.org/3/library/exceptions.html#ImportError)) when it cannot find a module. Code that currently checks for ImportError (in try-except) will still work. 

* Class methods relying on zero-argument `super()` will now work correctly when called from metaclass methods during class creation. 
