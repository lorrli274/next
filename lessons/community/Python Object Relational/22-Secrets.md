The main purpose of the new [`secrets`](https://docs.python.org/3/library/secrets.html#module-secrets) module is to provide an obvious way to reliably generate cryptographically strong pseudo-random values suitable for managing secrets, such as account authentication, tokens, and similar.

info> Note that the pseudo-random generators in the [`random`](https://docs.python.org/3/library/random.html#module-random) module should _NOT_ be used for security purposes. Use [`secrets`](https://docs.python.org/3/library/secrets.html#module-secrets) on Python 3.6+ and [`os.urandom()`](https://docs.python.org/3/library/os.html#os.urandom) on Python 3.5 and earlier.

