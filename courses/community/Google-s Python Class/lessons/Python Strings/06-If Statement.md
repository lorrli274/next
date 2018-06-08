Python does not use `{ }` to enclose blocks of code for if, loops, function etc.. Instead, Python uses the colon `:` and indentation/whitespace to group statements. The boolean test for an **if** does not need to be in parenthesis, and it can have `elif` and `else` clauses.

Any value can be used as an if-test. The zero values all count as false: `None`, 0, empty string, empty list, empty dictionary. There is also a Boolean type with two values: `True` and `False` (converted to an int, these are 1 and 0). Python has the usual comparison operations: `==`, `!=`, `<`, `<=`, `>`, `>=`. The boolean operators are the spelled out words `and`, `or`, `not`. 

Here's what the code might look like for a policeman pulling over a speeder. Notice how each block of `then`/`else` statements starts with a `:`, and the statements are grouped by their indentation:
    
```python    
if speed >= 80:
  print 'License and registration please'
  if mood == 'terrible' or speed >= 100:
    print 'You have the right to remain silent.'
  elif mood == 'bad' or speed >= 90:
    print "I'm going to have to write you a ticket."
    write_ticket()
  else:
    print "Let's try to keep it under 80 ok?"
```

info> Omitting the `:` is a common syntax mistake when typing in the above sort of code. 

If the code is short, you can put the code on the same line after `:`, like shown below. This also applies to functions, loops, etc.
    
```python    
if speed >= 80: print 'You are so busted'
else: print 'Have a nice day'
```
