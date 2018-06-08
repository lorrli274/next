**Regular expressions** are a powerful language for matching text patterns. In Python, a regular expression search is typically written as:
    
```python    
match = re.search(pat, str)
```

The `re.search()` method takes a regular expression pattern and a string and searches for that pattern within the string. If the search is successful, `search()` returns a match object or `None` otherwise. Therefore, the search is usually immediately followed by an if-statement to test if the search succeeded, as shown in the following example which searches for the pattern `word:` followed by a 3 letter word:
   
```python    
str = 'an example word:cat!!'
match = re.search(r'word:www', str)
# If-statement after search() tests if it succeeded
  if match:                      
    print 'found', match.group() ## 'found word:cat'
  else:
    print 'did not find'
```

The code `match = re.search(pat, str)` stores the search result in a variable named `match`. Then the if-statement tests the match. If true, the search succeeded and `match.group()` is the matching text. Otherwise if the match is false (`None` to be more specific), then the search did not succeed, and there is no matching text.

info> The `r` at the start of the pattern string designates a python `raw` string which passes through backslashes without change which is very handy for regular expressions.

