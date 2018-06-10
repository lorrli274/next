Square brackets can be used to indicate a set of chars, so `[abc]` matches `a` or `b` or `c`. The codes `\w`, `\s`, etc. work inside square brackets too, with the one exception that dot (`.`) just means a literal dot. For the emails problem, the square brackets are an easy way to add **.** and **-** to the set of chars which can appear around the **@** with the pattern `r'[\w.-]+@[\w.-]+'` to get the whole email address:
    
```python    
match = re.search(r'[\w.-]+@[\w.-]+', str)
if match:
  print match.group()  ## 'alice-b@google.com'
```

You can also use a dash to indicate a range, so `[a-z]` matches all lowercase letters. To use a dash without indicating a range, put the dash last. Example: `[abc-]`. An up-hat `^` at the start of a square-bracket set inverts it, so `[^ab]` means any char except **a** or **b**. 

