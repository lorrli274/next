**[PEP 515**][35] adds the ability to use underscores in numeric literals for improved readability. For example:
    
    
    >>> 1_000_000_000_000_000
    1000000000000000
    >>> 0x_FF_FF_FF_FF
    4294967295
    

Single underscores are allowed between digits and after any base specifier. Leading, trailing, or multiple underscores in a row are not allowed.

The [string formatting][36] language also now has support for the `'_'` option to signal the use of an underscore for a thousands separator for floating point presentation types and for integer presentation type `'d'`. For integer presentation types `'b'`, `'o'`, `'x'`, and `'X'`, underscores will be inserted every 4 digits:
    
    
    >>> '{:_}'.format(1000000)
    '1_000_000'
    >>> '{:_x}'.format(0xFFFFFFFF)
    'ffff_ffff'
    

See also

**[PEP 515**][35] – Underscores in Numeric Literals
: PEP written by Georg Brandl and Serhiy Storchaka.
