A new optional _source_ parameter has been added to the `[warnings.warn_explicit()`][279] function: the destroyed object which emitted a `[ResourceWarning`][15]. A _source_ attribute has also been added to `warnings.WarningMessage` (contributed by Victor Stinner in [bpo-26568][280] and [bpo-26567][281]).

When a `[ResourceWarning`][15] warning is logged, the `[tracemalloc`][14] module is now used to try to retrieve the traceback where the destroyed object was allocated.

Example with the script `example.py`:
    
    
    import warnings
    
    def func():
        return open(__file__)
    
    f = func()
    f = None
    

Output of the command `python3.6 -Wd -X tracemalloc=5 example.py`:
    
    
    example.py:7: ResourceWarning: unclosed file <_io.TextIOWrapper name='example.py' mode='r' encoding='UTF-8'>
      f = None
    Object allocated at (most recent call first):
      File "example.py", lineno 4
        return open(__file__)
      File "example.py", lineno 6
        f = func()
    

The "Object allocated at" traceback is new and is only displayed if `[tracemalloc`][14] is tracing Python memory allocations and if the `[warnings`][282] module was already imported.
