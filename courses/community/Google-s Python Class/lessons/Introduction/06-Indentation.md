One unusual Python feature is that the whitespace **indentation** of a piece of code affects its meaning. A logical block of statements such as the ones that make up a function should all have the same indentation, set in from the indentation of their parent function or "if" or whatever. If one of the lines in a group has a different indentation, it is flagged as a syntax error.

Python's use of whitespace feels a little strange at first. Avoid using TABs as they greatly complicate the indentation scheme (not to mention TABs may mean different things on different platforms). 

info> Make sure to always set your editor to insert spaces instead of TABs for Python code.

A common question asked by those new to programing is: "How many spaces should I indent?" Well, according to [the official Python style guide (PEP 8)](http://python.org/dev/peps/pep-0008/#indentation), you should indent with 4 spaces. 

Info> Fun fact: Google's internal style guideline dictates indenting by 2 spaces!
