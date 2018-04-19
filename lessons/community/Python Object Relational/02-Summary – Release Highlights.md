New syntax features:

* [PEP 498](https://docs.python.org/3/whatsnew/3.6.html#whatsnew36-pep498), formatted string literals.
* [PEP 515](https://docs.python.org/3/whatsnew/3.6.html#whatsnew36-pep515), underscores in numeric literals.
* [PEP 526](https://docs.python.org/3/whatsnew/3.6.html#whatsnew36-pep526), syntax for variable annotations.
* [PEP 525](https://docs.python.org/3/whatsnew/3.6.html#whatsnew36-pep525), asynchronous generators.
* [PEP 530](https://docs.python.org/3/whatsnew/3.6.html#whatsnew36-pep530): asynchronous comprehensions.

New library modules:

* [secrets](https://docs.python.org/3/library/secrets.html#module-secrets): [PEP 506 – Adding A Secrets Module To The Standard Library](https://docs.python.org/3/whatsnew/3.6.html#whatsnew36-pep506).

CPython implementation improvements:

* The [dict](https://docs.python.org/3/library/stdtypes.html#typesmapping) type has been reimplemented to use a [more compact representation](https://docs.python.org/3/whatsnew/3.6.html#whatsnew36-compactdict) based on a [proposal by Raymond Hettinger](https://mail.python.org/pipermail/python-dev/2012-December/123028.html) and similar to the [PyPy dict implementation](https://morepypy.blogspot.com/2015/01/faster-more-memory-efficient-and-more.html). This resulted in dictionaries using 20% to 25% less memory when compared to Python 3.5.

* Customization of class creation has been simplified with the [new protocol](https://morepypy.blogspot.com/2015/01/faster-more-memory-efficient-and-more.html).

* The class attribute definition order is [now preserved](https://docs.python.org/3/whatsnew/3.6.html#whatsnew36-pep487).

* The order of elements in `**kwargs` now [corresponds to the order](https://docs.python.org/3/whatsnew/3.6.html#whatsnew36-pep520) in which keyword arguments were passed to the function.

* DTrace and SystemTap [probing support](https://docs.python.org/3/whatsnew/3.6.html#whatsnew36-pep468) has been added.

* The new [PYTHONMALLOC](https://docs.python.org/3/whatsnew/3.6.html#whatsnew36-pythonmalloc) environment variable can now be used to debug the interpreter memory allocation and access errors.

Significant improvements in the standard library:

* The [`asyncio`](https://docs.python.org/3/library/asyncio.html#module-asyncio) module has received new features, significant usability and performance improvements, and a fair amount of bug fixes. Starting with Python 3.6 the `asyncio` module is no longer provisional and its API is considered stable.

* A new [file system path protocol](https://docs.python.org/3/whatsnew/3.6.html#whatsnew36-pep519) has been implemented to support [path-like objects](https://docs.python.org/glossary.html#term-path-like-object). All standard library functions operating on paths have been updated to work with the new protocol.

* The [`datetime`](https://docs.python.org/library/datetime.html#module-datetime "datetime: Basic date and time types.") module has gained support for [Local Time Disambiguation](https://docs.python.org#whatsnew36-pep495).

* The [`typing`](https://docs.python.org/library/typing.html#module-typing "typing: Support for type hints (see PEP 484).") module received a number of [improvements](https://docs.python.org#whatsnew36-typing).

* The [`tracemalloc`](https://docs.python.org/library/tracemalloc.html#module-tracemalloc "tracemalloc: Trace memory allocations.") module has been significantly reworked and is now used to provide better output for [`ResourceWarning`](https://docs.python.org/library/exceptions.html#ResourceWarning "ResourceWarning") as well as provide better diagnostics for memory allocation errors. See the [PYTHONMALLOC section](https://docs.python.org#whatsnew36-pythonmalloc) for more information.

Security improvements:

* The new [`secrets`](https://docs.python.org/library/secrets.html#module-secrets "secrets: Generate secure random numbers for managing secrets.") module has been added to simplify the generation of cryptographically strong pseudo-random numbers suitable for managing secrets such as account authentication, tokens, and similar.

* On Linux, [`os.urandom()`](https://docs.python.org/library/os.html#os.urandom "os.urandom") now blocks until the system urandom entropy pool is initialized to increase the security. See the [**PEP 524**](https://www.python.org/dev/peps/pep-0524) for the rationale.

* The [`hashlib`](https://docs.python.org/library/hashlib.html#module-hashlib "hashlib: Secure hash and message digest algorithms.") and [`ssl`](https://docs.python.org/library/ssl.html#module-ssl "ssl: TLS/SSL wrapper for socket objects") modules now support OpenSSL 1.1.0.

* The default settings and feature set of the [`ssl`](https://docs.python.org/library/ssl.html#module-ssl "ssl: TLS/SSL wrapper for socket objects") module have been improved.

* The [`hashlib`](https://docs.python.org/library/hashlib.html#module-hashlib "hashlib: Secure hash and message digest algorithms.") module received support for the BLAKE2, SHA-3 and SHAKE hash algorithms and the [`scrypt()`][22] key derivation function.

Windows improvements:

* [PEP 528][23] and [PEP 529](https://docs.python.org#whatsnew36-pep529), Windows filesystem and console encoding changed to UTF-8.

* The `py.exe` launcher, when used interactively, no longer prefers Python 2 over Python 3 when the user doesn't specify a version (via command line arguments or a config file). Handling of shebang lines remains unchanged - "python" refers to Python 2 in that case.

* `python.exe` and `pythonw.exe` have been marked as long-path aware, which means that the 260 character path limit may no longer apply. See [removing the MAX_PATH limitation](https://docs.python.org/using/windows.html#max-path) for details.

* A `._pth` file can be added to force isolated mode and fully specify all search paths to avoid registry and environment lookup. See [the documentation](https://docs.python.org/using/windows.html#finding-modules) for more information.

* A `python36.zip` file now works as a landmark to infer [`PYTHONHOME`](https://docs.python.org/using/cmdline.html#envvar-PYTHONHOME). See [the documentation](https://docs.python.org/using/windows.html#finding-modules) for more information.
