New syntax features:

* [PEP 498][2], formatted string literals.
* [PEP 515][3], underscores in numeric literals.
* [PEP 526][4], syntax for variable annotations.
* [PEP 525][5], asynchronous generators.
* [PEP 530][6]: asynchronous comprehensions.

New library modules:

CPython implementation improvements:

Significant improvements in the standard library:

* The [`asyncio`][7] module has received new features, significant usability and performance improvements, and a fair amount of bug fixes. Starting with Python 3.6 the `asyncio` module is no longer provisional and its API is considered stable.
* A new [file system path protocol][8] has been implemented to support [path-like objects][9]. All standard library functions operating on paths have been updated to work with the new protocol.
* The [`datetime`][10] module has gained support for [Local Time Disambiguation][11].
* The [`typing`][12] module received a number of [improvements][13].
* The [`tracemalloc`][14] module has been significantly reworked and is now used to provide better output for [`ResourceWarning`][15] as well as provide better diagnostics for memory allocation errors. See the [PYTHONMALLOC section][16] for more information.

Security improvements:

* The new [`secrets`][17] module has been added to simplify the generation of cryptographically strong pseudo-random numbers suitable for managing secrets such as account authentication, tokens, and similar.
* On Linux, [`os.urandom()`][18] now blocks until the system urandom entropy pool is initialized to increase the security. See the [**PEP 524**][19] for the rationale.
* The [`hashlib`][20] and [`ssl`][21] modules now support OpenSSL 1.1.0.
* The default settings and feature set of the [`ssl`][21] module have been improved.
* The [`hashlib`][20] module received support for the BLAKE2, SHA-3 and SHAKE hash algorithms and the [`scrypt()`][22] key derivation function.

Windows improvements:

* [PEP 528][23] and [PEP 529][23], Windows filesystem and console encoding changed to UTF-8.
* The `py.exe` launcher, when used interactively, no longer prefers Python 2 over Python 3 when the user doesn't specify a version (via command line arguments or a config file). Handling of shebang lines remains unchanged - "python" refers to Python 2 in that case.
* `python.exe` and `pythonw.exe` have been marked as long-path aware, which means that the 260 character path limit may no longer apply. See [removing the MAX_PATH limitation][24] for details.
* A `._pth` file can be added to force isolated mode and fully specify all search paths to avoid registry and environment lookup. See [the documentation][25] for more information.
* A `python36.zip` file now works as a landmark to infer [`PYTHONHOME`][26]. See [the documentation][25] for more information.
