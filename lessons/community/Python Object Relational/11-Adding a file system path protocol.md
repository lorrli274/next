File system paths have historically been represented as `[str`][45] or `[bytes`][46] objects. This has led to people who write code which operate on file system paths to assume that such objects are only one of those two types (an `[int`][47] representing a file descriptor does not count as that is not a file path). Unfortunately that assumption prevents alternative object representations of file system paths like `[pathlib`][48] from working with pre-existing code, including Python's standard library.

To fix this situation, a new interface represented by `[os.PathLike`][49] has been defined. By implementing the `[__fspath__()`][50] method, an object signals that it represents a path. An object can then provide a low-level representation of a file system path as a `[str`][45] or `[bytes`][46] object. This means an object is considered [path-like][9] if it implements `[os.PathLike`][49] or is a `[str`][45] or `[bytes`][46] object which represents a file system path. Code can use `[os.fspath()`][51], `[os.fsdecode()`][52], or `[os.fsencode()`][53] to explicitly get a `[str`][45] and/or `[bytes`][46] representation of a path-like object.

The built-in `[open()`][54] function has been updated to accept `[os.PathLike`][49] objects, as have all relevant functions in the `[os`][55] and `[os.path`][56] modules, and most other functions and classes in the standard library. The `[os.DirEntry`][57] class and relevant classes in `[pathlib`][48] have also been updated to implement `[os.PathLike`][49].

The hope is that updating the fundamental functions for operating on file system paths will lead to third-party code to implicitly support all [path-like objects][9] without any code changes, or at least very minimal ones (e.g. calling `[os.fspath()`][51] at the beginning of code before operating on a path-like object).

Here are some examples of how the new interface allows for `[pathlib.Path`][58] to be used more easily and transparently with pre-existing code:
    
    
    >>> import pathlib
    >>> with open(pathlib.Path("README")) as f:
    ...     contents = f.read()
    ...
    >>> import os.path
    >>> os.path.splitext(pathlib.Path("some_file.txt"))
    ('some_file', '.txt')
    >>> os.path.join("/a/b", pathlib.Path("c"))
    '/a/b/c'
    >>> import os
    >>> os.fspath(pathlib.Path("some_file.txt"))
    'some_file.txt'
    

(Implemented by Brett Cannon, Ethan Furman, Dusty Phillips, and Jelle Zijlstra.)

See also

**[PEP 519**][59] – Adding a file system path protocol
: PEP written by Brett Cannon and Koos Zevenhoven.
