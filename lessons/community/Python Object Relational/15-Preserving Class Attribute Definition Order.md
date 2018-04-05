Attributes in a class definition body have a natural ordering: the same order in which the names appear in the source. This order is now preserved in the new class's `[__dict__`][70] attribute.

Also, the effective default class _execution_ namespace (returned from [type.__prepare__()][71]) is now an insertion-order-preserving mapping.

See also

**[PEP 520**][72] – Preserving Class Attribute Definition Order
: PEP written and implemented by Eric Snow.

