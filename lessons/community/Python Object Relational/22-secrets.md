The main purpose of the new `[secrets`][17] module is to provide an obvious way to reliably generate cryptographically strong pseudo-random values suitable for managing secrets, such as account authentication, tokens, and similar.

Warning

Note that the pseudo-random generators in the `[random`][101] module should _NOT_ be used for security purposes. Use `[secrets`][17] on Python 3.6+ and `[os.urandom()`][18] on Python 3.5 and earlier.

See also

**[PEP 506**][102] – Adding A Secrets Module To The Standard Library
: PEP written and implemented by Steven D'Aprano.
