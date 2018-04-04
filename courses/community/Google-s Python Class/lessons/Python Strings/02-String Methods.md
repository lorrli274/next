Here are some of the most common string methods. A method is like a function, but it runs "on" an object. If the variable s is a string, then the code `s.lower()` runs the `lower()` method on that string object and returns the result (this idea of a method running on an object is one of the basic ideas that make up Object Oriented Programming, OOP). Here are some of the most common string methods:

* `s.lower()`, `s.upper()` -- returns the lowercase or uppercase version of the string

* `s.strip()` -- returns a string with whitespace removed from the start and end

* `s.isalpha()`/`s.isdigit()`/`s.isspace()`... -- tests if all the string chars are in the various character classes

* `s.startswith`('other'), `s.endswith`('other') -- tests if the string starts or ends with the given other string

* `s.find`('other') -- searches for the given other string (not a regular expression) within s, and returns the first index where it begins 

* `s.replace`('old', 'new') -- returns a string where all occurrences of 'old' have been replaced by 'new'

* `s.split`('delim') -- returns a list of substrings separated by the given delimiter. The delimiter is not a regular expression, it's just text. 'aaa,bbb,ccc'.split(',') -> ['aaa', 'bbb', 'ccc']. As a convenient special case `s.split()` (with no arguments) splits on all whitespace chars.

* `s.join`(list) -- opposite of `split()`, joins the elements in the given list together using the string as the delimiter. e.g. '---'.join(['aaa', 'bbb', 'ccc']) -> aaa---bbb---ccc

A google search for "python str" should lead you to the official [python.org string methods](http://docs.python.org/library/stdtypes.html#string-methods) which lists all the str methods.

Python does not have a separate character type. Instead an expression like `s[8]` returns a string-length-1 containing the character. With that string-length-1, the operators ==, 
