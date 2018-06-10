Suppose you want to find the email address inside the string **xyz alice-b@google.com purple monkey**. We'll use this as a running example to demonstrate more regular expression features. Here's an attempt using the pattern `r'\w+@\w+'`:
    
```python    
str = 'purple alice-b@google.com monkey dishwasher'
match = re.search(r'\w+@\w+', str)
if match:
  print match.group()  ## 'b@google'
```

The search does not get the whole email address in this case because the `\w` does not match the **-** or **.** in the address. We'll fix this using the regular expression features.
