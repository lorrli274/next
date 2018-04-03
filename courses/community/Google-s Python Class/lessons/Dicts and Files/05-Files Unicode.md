The "codecs" module provides support for reading a unicode file.
    
```python    
import codecs

f = codecs.open('foo.txt', 'rU', 'utf-8')
for line in f:
  # here line is a *unicode* string
```

For writing, use `f.write()` since print does not fully support unicode.

