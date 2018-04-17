Attributes in a class definition body have a natural ordering: the same order in which the names appear in the source. This order is now preserved in the new class's [`__dict__`](https://docs.python.org/3/library/stdtypes.html#object.__dict__) attribute.

Also, the effective default class _execution_ namespace (returned from [`type.__prepare__()`](https://docs.python.org/3/reference/datamodel.html#prepare)) is now an insertion-order-preserving mapping.
