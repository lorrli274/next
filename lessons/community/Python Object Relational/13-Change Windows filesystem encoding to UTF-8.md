Representing filesystem paths is best performed with str (Unicode) rather than bytes. However, there are some situations where using bytes is sufficient and correct.

Prior to Python 3.6, data loss could result when using bytes paths on Windows. With this change, using bytes to represent paths is now supported on Windows, provided those bytes are encoded with the encoding returned by `[sys.getfilesystemencoding()`][64], which now defaults to `'utf-8'`.

Applications that do not use str to represent paths should use `[os.fsencode()`][53] and `[os.fsdecode()`][52] to ensure their bytes are correctly encoded. To revert to the previous behaviour, set `[PYTHONLEGACYWINDOWSFSENCODING`][65] or call `[sys._enablelegacywindowsfsencoding()`][66].

See **[PEP 529**][67] for more information and discussion of code modifications that may be required.
