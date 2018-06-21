Regular Python strings are not **Unicode**, they are just plain bytes. To create a **Unicode string**, use the `u` prefix on the string literal:
    
```python    
> ustring = u'A Unicode \u018e string \xf1'
> ustring
u'A unicode \u018e string \xf1'
```

A Unicode string is a different type of object from regular `str` string, but the Unicode string is compatible. The various libraries such as regular expressions work correctly if passed a Unicode string instead of a regular string.

info> A unicode string and the `str` string share a common superclass `basestring`.

To convert a Unicode string to bytes with an encoding such as `utf-8`, call the `ustring.encode` (`utf-8`) method on the Unicode string. Going the other direction, the Unicode function converts encoded plain bytes to a Unicode string:
    
```python    
## (ustring from above contains a Unicode string)
> s = ustring.encode('utf-8')
> s
'A Unicode \xc6\x8e string \xc3\xb1'  ## bytes of utf-8 encoding
> t = unicode(s, 'utf-8')             ## Convert bytes back to a Unicode string
> t == ustring                      ## It's the same as the original, yay!

True
```

The built-in print does not work fully with Unicode strings. You can `encode()` first to print in `utf-8`.
