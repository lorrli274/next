Two new enumeration base classes have been added to the `[enum`][175] module: `[Flag`][176] and `IntFlags`. Both are used to define constants that can be combined using the bitwise operators. (Contributed by Ethan Furman in [bpo-23591][177].)

Many standard library modules have been updated to use the `IntFlags` class for their constants.

The new `[enum.auto`][178] value can be used to assign values to enum members automatically:
    
    
    >>> from enum import Enum, auto
    >>> class Color(Enum):
    ...     red = auto()
    ...     blue = auto()
    ...     green = auto()
    ...
    >>> list(Color)
    [, , ]
    
