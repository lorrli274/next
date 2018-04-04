The parenthesis ( ) group mechanism can be combined with `findall()`. If the pattern includes 2 or more parenthesis groups, then instead of returning a list of strings, `findall()` returns a list of `tuples`. Each `tuple` represents one match of the pattern, and inside the `tuple` is the `group(1)`, `group(2)` .. data. So if 2 parenthesis groups are added to the email pattern, then `findall()` returns a list of `tuples`, each length 2 containing the username and host, e.g. ('alice', 'google.com').
    
```python    
str = 'purple alice@google.com, blah monkey bob@abc.com blah dishwasher'
tuples = re.findall(r'([w.-]+)@([w.-]+)', str)
print tuples  ## [('alice', 'google.com'), ('bob', 'abc.com')]
for tuple in tuples:
  print tuple[0]  ## username
  print tuple[1]  ## host
```

Once you have the list of tuples, you can loop over it to do some computation for each `tuple`. If the pattern includes no parenthesis, then `findall()` returns a list of found strings as in earlier examples. If the pattern includes a single set of parenthesis, then `findall()` returns a list of strings corresponding to that single group. 

(Obscure optional feature: Sometimes you have paren ( ) groupings in the pattern, but which you do not want to extract. In that case, write the parens with a ?: at the start, e.g. (?: ) and that left paren will not count as a group result.)
