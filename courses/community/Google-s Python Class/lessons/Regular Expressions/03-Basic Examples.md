The basic rules of regular expression search for a pattern within a string are:

* The search proceeds through the string from start to end, stopping at the first match found 

* All of the pattern must be matched, but not all of the string 

* If `match = re.search(pat, str)` is successful, match is not `None` and in particular `match.group()` is the matching text 

```python
## Search for pattern 'iii' in string 'piiig'.
## All of the pattern must match, but it may appear anywhere.
## On success, match.group() is matched text.
match = re.search(r'iii', 'piiig') =>  found, match.group() == "iii"
match = re.search(r'igs', 'piiig') =>  not found, match == None

## . = any char but \n
match = re.search(r'..g', 'piiig') =>  found, match.group() == "iig"

## \d = digit char, \w = word char
match = re.search(r'\d\d\d', 'p123g') =>  found, match.group() == "123"
match = re.search(r'\w\w\w', '@@abcd!!') =>  found, match.group() == "abc"
```
