Things get more interesting when you use `+` and `*` to specify repetition in the pattern.
* `+`: 1 or more occurrences of the pattern to its left, e.g. 'i+' = one or more i's 
* `*`: 0 or more occurrences of the pattern to its left 
* `?`: Match 0 or 1 occurrences of the pattern to its left 

## Leftmost & Largest

First the search finds the leftmost match for the pattern, and second it tries to use up as much of the string as possible. Example: `+` and `*` go as far as possible, they are said to be **greedy**.
