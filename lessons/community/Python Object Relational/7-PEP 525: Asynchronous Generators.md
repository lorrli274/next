**[PEP 492**][37] introduced support for native coroutines and `async` / `await` syntax to Python 3.5. A notable limitation of the Python 3.5 implementation is that it was not possible to use `await` and `yield` in the same function body. In Python 3.6 this restriction has been lifted, making it possible to define _asynchronous generators_:
    
    
    async def ticker(delay, to):
        """Yield numbers from 0 to *to* every *delay* seconds."""
        for i in range(to):
            yield i
            await asyncio.sleep(delay)
    

The new syntax allows for faster and more concise code.

See also

**[PEP 525**][38] – Asynchronous Generators
: PEP written and implemented by Yury Selivanov.
