The `re.sub`(pat, replacement, str) function searches for all the instances of pattern in the given string, and replaces them. The replacement string can include '1', '2' which refer to the text from `group(1)`, `group(2)`, and so on from the original matching text.

Here's an example which searches for all the email addresses, and changes them to keep the `user(\1)` but have yo-yo-dyne.com as the host.
    
```python    
str = 'purple alice@google.com, blah monkey bob@abc.com blah dishwasher'
## re.sub(pat, replacement, str) -- returns new string with all replacements,
## 1 is group(1), 2 group(2) in the replacement
print re.sub(r'([w.-]+)@([w.-]+)', r'1@yo-yo-dyne.com', str)
## purple alice@yo-yo-dyne.com, blah monkey bob@yo-yo-dyne.com blah dishwasher
```
