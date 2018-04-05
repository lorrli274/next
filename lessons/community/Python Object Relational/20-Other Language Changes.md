Some smaller changes made to the core Python language are:

* A `global` or `nonlocal` statement must now textually appear before the first use of the affected name in the same scope. Previously this was a `SyntaxWarning`.
* It is now possible to set a [special method][92] to `None` to indicate that the corresponding operation is not available. For example, if a class sets `[__iter__()`][93] to `None`, the class is not iterable. (Contributed by Andrew Barnert and Ivan Levkivskyi in [bpo-25958][94].)
* Long sequences of repeated traceback lines are now abbreviated as `"[Previous line repeated {count} more times]"` (see [traceback][95] for an example). (Contributed by Emanuel Barry in [bpo-26823][96].)
* Import now raises the new exception `[ModuleNotFoundError`][97] (subclass of `[ImportError`][98]) when it cannot find a module. Code that currently checks for ImportError (in try-except) will still work. (Contributed by Eric Snow in [bpo-15767][99].)
* Class methods relying on zero-argument `super()` will now work correctly when called from metaclass methods during class creation. (Contributed by Martin Teichmann in [bpo-23722][100].)
