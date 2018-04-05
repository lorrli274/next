**[PEP 530**][39] adds support for using `async for` in list, set, dict comprehensions and generator expressions:
    
    
    result = [i async for i in aiter() if i % 2]
    

Additionally, `await` expressions are supported in all kinds of comprehensions:
    
    
    result = [await fun() for fun in funcs if await condition()]
    

See also

**[PEP 530**][39] – Asynchronous Comprehensions
: PEP written and implemented by Yury Selivanov.
