Python can now be built `\--with-dtrace` which enables static markers for the following events in the interpreter:

* function call/return
* garbage collection started/finished
* line of code executed.

This can be used to instrument running interpreters in production, without the need to recompile specific debug builds or providing application-specific profiling/debugging code.

More details in [Instrumenting CPython with DTrace and SystemTap][90].

The current implementation is tested on Linux and macOS. Additional markers may be added in the future.

(Contributed by Łukasz Langa in [bpo-21590][91], based on patches by Jesús Cea Avión, David Malcolm, and Nikhil Benesch.)
