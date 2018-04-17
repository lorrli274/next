File system paths have historically been represented as `[str`](https://docs.python.org/library/stdtypes.html#str "str") or `[bytes`](https://docs.python.org/library/stdtypes.html#bytes "bytes") objects. This has led to people who write code which operate on file system paths to assume that such objects are only one of those two types (an `[int`](https://docs.python.org/library/functions.html#int "int") representing a file descriptor does not count as that is not a file path). Unfortunately that assumption prevents alternative object representations of file system paths like [`pathlib`](https://docs.python.org/library/pathlib.html#module-pathlib "pathlib: Object-oriented filesystem paths") from working with pre-existing code, including Python's standard library.

To fix this situation, a new interface represented by [`os.PathLike`](https://docs.python.org/library/os.html#os.PathLike "os.PathLike") has been defined. By implementing the [`__fspath__()`](https://docs.python.org/library/os.html#os.PathLike.__fspath__ "os.PathLike.__fspath__") method, an object signals that it represents a path. An object can then provide a low-level representation of a file system path as a [`str`](https://docs.python.org/library/stdtypes.html#str "str") or [`bytes`](https://docs.python.org/library/stdtypes.html#bytes "bytes") object. This means an object is considered [path-like](https://docs.python.org/glossary.html#term-path-like-object) if it implements [`os.PathLike`](https://docs.python.org/library/os.html#os.PathLike "os.PathLike") or is a [`str`](https://docs.python.org/library/stdtypes.html#str "str") or [`bytes`](https://docs.python.org/library/stdtypes.html#bytes "bytes") object which represents a file system path. Code can use [`os.fspath()`](https://docs.python.org/library/os.html#os.fspath "os.fspath"), [`os.fsdecode()`](https://docs.python.org/library/os.html#os.fsdecode "os.fsdecode"), or [`os.fsencode()`](https://docs.python.org/library/os.html#os.fsencode "os.fsencode") to explicitly get a [`str`](https://docs.python.org/library/stdtypes.html#str "str") and/or [`bytes`](https://docs.python.org/library/stdtypes.html#bytes "bytes") representation of a path-like object.

The built-in [`open()`](https://docs.python.org/library/functions.html#open "open") function has been updated to accept [`os.PathLike`][49] objects, as have all relevant functions in the [`os`](https://docs.python.org/library/os.html#module-os "os: Miscellaneous operating system interfaces.") and [`os.path`](https://docs.python.org/library/os.path.html#module-os.path "os.path: Operations on pathnames.") modules, and most other functions and classes in the standard library. The [`os.DirEntry`](https://docs.python.org/library/os.html#os.DirEntry "os.DirEntry") class and relevant classes in [`pathlib`](https://docs.python.org/library/pathlib.html#module-pathlib "pathlib: Object-oriented filesystem paths") have also been updated to implement [`os.PathLike`](https://docs.python.org/library/os.html#os.PathLike "os.PathLike").

The hope is that updating the fundamental functions for operating on file system paths will lead to third-party code to implicitly support all [path-like objects](https://docs.python.org/glossary.html#term-path-like-object) without any code changes, or at least very minimal ones (e.g. calling [`os.fspath()`](https://docs.python.org/library/os.html#os.fspath "os.fspath") at the beginning of code before operating on a path-like object).

Here are some examples of how the new interface allows for [`pathlib.Path`](https://docs.python.org/library/pathlib.html#pathlib.Path "pathlib.Path") to be used more easily and transparently with pre-existing code:
    
```python    
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
```    
