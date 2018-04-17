[PEP 530](https://www.python.org/dev/peps/pep-0530) adds support for using `async for` in list, set, dict **comprehensions** and generator expressions:
    
```python     
result = [i async for i in aiter() if i % 2]
```

Additionally, `await` expressions are supported in all kinds of comprehensions:
    
```python
result = [await fun() for fun in funcs if await condition()]
```    
