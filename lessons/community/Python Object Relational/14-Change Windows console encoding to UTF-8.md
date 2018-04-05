The default console on Windows will now accept all Unicode characters and provide correctly read str objects to Python code. `sys.stdin`, `sys.stdout` and `sys.stderr` now default to utf-8 encoding.

This change only applies when using an interactive console, and not when redirecting files or pipes. To revert to the previous behaviour for interactive console use, set `[PYTHONLEGACYWINDOWSSTDIO`][68].

See also

**[PEP 528**][69] – Change Windows console encoding to UTF-8
: PEP written and implemented by Steve Dower.
