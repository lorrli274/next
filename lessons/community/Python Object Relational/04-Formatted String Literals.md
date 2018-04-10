[**PEP 498**](https://www.python.org/dev/peps/pep-0498) introduces a new kind of string literals: **f-strings**, or [**formatted string literals**](https://docs.python.org/reference/lexical_analysis.html#f-strings).

Formatted string literals are prefixed with `'f'` and are similar to the format strings accepted by [`str.format()`](https://docs.python.org/library/stdtypes.html#str.format "str.format"). They contain replacement fields surrounded by curly braces. The replacement fields are expressions, which are evaluated at run time, and then formatted using the [`format()`](https://docs.python.org/3/library/functions.html#format) protocol:
    
```python    
>>> name = "Fred"
>>> f"He said his name is {name}."
'He said his name is Fred.'
>>> width = 10
>>> precision = 4
>>> value = decimal.Decimal("12.34567")
>>> f"result: {value:{width}.{precision}}"  # nested fields
'result:      12.35'
```

https://docs.python.org/3/library/functions.html#format
