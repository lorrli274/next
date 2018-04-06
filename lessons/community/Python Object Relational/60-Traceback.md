Both the traceback module and the interpreter's builtin exception display now abbreviate long sequences of repeated lines in tracebacks as shown in the following example:
    
    
    >>> def f(): f()
    ...
    >>> f()
    Traceback (most recent call last):
      File "", line 1, in 
      File "", line 1, in f
      File "", line 1, in f
      File "", line 1, in f
      [Previous line repeated 995 more times]
    RecursionError: maximum recursion depth exceeded
    

(Contributed by Emanuel Barry in [bpo-26823][96].)
