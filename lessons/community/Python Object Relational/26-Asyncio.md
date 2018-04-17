Starting with Python 3.6 the `asyncio` module is no longer provisional and its API is considered stable.

Notable changes in the [`asyncio`](https://docs.python.org/3/library/asyncio.html#module-asyncio) module since Python 3.5.0 (all backported to 3.5.x due to the provisional status):

* The [`get_event_loop()`](https://docs.python.org/3/library/asyncio-eventloops.html#asyncio.get_event_loop) function has been changed to always return the currently running loop when called from couroutines and callbacks. (Contributed by Yury Selivanov in [bpo-28613][107].)

* The [`ensure_future()`](https://docs.python.org/3/library/asyncio-task.html#asyncio.ensure_future) function and all functions that use it, such as `loop.run_until_complete()`, now accept all kinds of [awaitable objects](https://docs.python.org/3/glossary.html#term-awaitable). (Contributed by Yury Selivanov.)

* New [`run_coroutine_threadsafe()`](https://docs.python.org/3/library/asyncio-task.html#asyncio.run_coroutine_threadsafe) function to submit coroutines to event loops from other threads. (Contributed by Vincent Michel.)

* New [`Transport.is_closing()`](https://docs.python.org/3/library/asyncio-protocol.html#asyncio.BaseTransport.is_closing) method to check if the transport is closing or closed. (Contributed by Yury Selivanov.)

* The `loop.create_server()` method can now accept a list of hosts. (Contributed by Yann Sionneau.)

* New `loop.create_future()` method to create Future objects. This allows alternative event loop implementations, such as [uvloop](https://github.com/MagicStack/uvloop), to provide a faster [`asyncio.Future`](https://docs.python.org/3/library/asyncio-task.html#asyncio.Future) implementation. (Contributed by Yury Selivanov in [bpo-27041][114].)

* New `loop.get_exception_handler()` method to get the current exception handler. (Contributed by Yury Selivanov in [bpo-27040][115].)

* New [`StreamReader.readuntil()`](https://docs.python.org/3/library/asyncio-stream.html#asyncio.StreamReader.readuntil) method to read data from the stream until a separator bytes sequence appears. (Contributed by Mark Korenberg.)

* The performance of [`StreamReader.readexactly()`](https://docs.python.org/3/library/asyncio-stream.html#asyncio.StreamReader.readexactly) has been improved. (Contributed by Mark Korenberg in [bpo-28370][118].)

* The `loop.getaddrinfo()` method is optimized to avoid calling the system `getaddrinfo` function if the address is already resolved. (Contributed by A. Jesse Jiryu Davis.)

* The `loop.stop()` method has been changed to stop the loop immediately after the current iteration. Any new callbacks scheduled as a result of the last iteration will be discarded. (Contributed by Guido van Rossum in [bpo-25593][119].)

* `Future.set_exception` will now raise [`TypeError`](https://docs.python.org/3/library/exceptions.html#TypeError) when passed an instance of the [`StopIteration`](https://docs.python.org/3/library/exceptions.html#StopIteration) exception. (Contributed by Chris Angelico in [bpo-26221][122].)

* New [`loop.connect_accepted_socket()`](https://docs.python.org/3/library/asyncio-eventloop.html#asyncio.BaseEventLoop.connect_accepted_socket) method to be used by servers that accept connections outside of asyncio, but that use asyncio to handle them. (Contributed by Jim Fulton in [bpo-27392][124].)

* `TCP_NODELAY` flag is now set for all TCP transports by default. (Contributed by Yury Selivanov in [bpo-27456][125].)

* New [`loop.shutdown_asyncgens()`](https://docs.python.org/3/library/asyncio-eventloop.html#asyncio.AbstractEventLoop.shutdown_asyncgens) to properly close pending asynchronous generators before closing the loop. (Contributed by Yury Selivanov in [bpo-28003][127].)

* [`Future`](https://docs.python.org/3/library/asyncio-task.html#asyncio.Future) and [`Task`](https://docs.python.org/3/library/asyncio-task.html#asyncio.Task) classes now have an optimized C implementation which makes asyncio code up to 30% faster. (Contributed by Yury Selivanov and INADA Naoki in [bpo-26081][129] and [bpo-28544][130].)
