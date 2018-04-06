Since the `[typing`][12] module is [provisional][264], all changes introduced in Python 3.6 have also been backported to Python 3.5.x.

The `[typing`][12] module has a much improved support for generic type aliases. For example `Dict[str, Tuple[S, T]]` is now a valid type annotation. (Contributed by Guido van Rossum in [Github #195][265].)

The `[typing.ContextManager`][148] class has been added for representing `[contextlib.AbstractContextManager`][147]. (Contributed by Brett Cannon in [bpo-25609][149].)

The `[typing.Collection`][266] class has been added for representing `[collections.abc.Collection`][133]. (Contributed by Ivan Levkivskyi in [bpo-27598][134].)

The `[typing.ClassVar`][267] type construct has been added to mark class variables. As introduced in **[PEP 526**][32], a variable annotation wrapped in ClassVar indicates that a given attribute is intended to be used as a class variable and should not be set on instances of that class. (Contributed by Ivan Levkivskyi in [Github #280][268].)

A new `[TYPE_CHECKING`][269] constant that is assumed to be `True` by the static type chekers, but is `False` at runtime. (Contributed by Guido van Rossum in [Github #230][270].)

A new `[NewType()`][271] helper function has been added to create lightweight distinct types for annotations:
    
    
    from typing import NewType
    
    UserId = NewType('UserId', int)
    some_id = UserId(524313)
    

The static type checker will treat the new type as if it were a subclass of the original type. (Contributed by Ivan Levkivskyi in [Github #189][272].)
