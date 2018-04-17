Attributes in a class definition body have a natural ordering: the same order in which the names appear in the source. This order is now preserved in the new class's [`__dict__`](https://morepypy.blogspot.com/2015/01/faster-more-memory-efficient-and-more.html) attribute.

Also, the effective default class _execution_ namespace (returned from [`type.__prepare__()`](https://docs.python.org/3/whatsnew/3.6.html#whatsnew36-pep487)) is now an insertion-order-preserving mapping.
