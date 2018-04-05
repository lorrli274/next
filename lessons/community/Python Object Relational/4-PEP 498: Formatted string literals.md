[**PEP 498**][27] introduces a new kind of string literals: _f-strings_, or [formatted string literals][28].

Formatted string literals are prefixed with `'f'` and are similar to the format strings accepted by [`str.format()`][29]. They contain replacement fields surrounded by curly braces. The replacement fields are expressions, which are evaluated at run time, and then formatted using the `[format()`][30] protocol:
    
    
    >>> name = "Fred"
    >>> f"He said his name is {name}."
    'He said his name is Fred.'
    >>> width = 10
    >>> precision = 4
    >>> value = decimal.Decimal("12.34567")
    >>> f"result: {value:{width}.{precision}}"  # nested fields
    'result:      12.35'
