Representing filesystem paths is best performed with str (Unicode) rather than bytes. However, there are some situations where using bytes is sufficient and correct.

Prior to Python 3.6, data loss could result when using bytes paths on Windows. With this change, using bytes to represent paths is now supported on Windows, provided those bytes are encoded with the encoding returned by [`sys.getfilesystemencoding()`](https://docs.python.org/3/library/sys.html#sys.getfilesystemencoding), which now defaults to `'utf-8'`.

Applications that do not use str to represent paths should use [`os.fsencode()`](https://docs.python.org/3/library/os.html#os.fsencode) and [`os.fsdecode()`](https://docs.python.org/library/os.html#os.fsdecode "os.fsdecode") to ensure their bytes are correctly encoded. To revert to the previous behaviour, set [`PYTHONLEGACYWINDOWSFSENCODING`](https://docs.python.org/3/using/cmdline.html#envvar-PYTHONLEGACYWINDOWSFSENCODING) or call [`sys._enablelegacywindowsfsencoding()`](https://docs.python.org/3/library/sys.html#sys._enablelegacywindowsfsencoding).

See [PEP 529](https://docs.python.org/3/whatsnew/3.6.html#whatsnew36-compactdict) for more information and discussion of code modifications that may be required.
