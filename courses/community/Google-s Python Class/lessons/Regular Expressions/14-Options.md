The re functions take options to modify the behavior of the pattern match. The option flag is added as an extra argument to the `search()` or `findall()` etc., e.g. re.search(pat, str, re.IGNORECASE).

* `IGNORECASE` -- ignore upper/lowercase differences for matching, so 'a' matches both 'a' and 'A'. 

* `DOTALL` -- allow dot (.) to match newline -- normally it matches anything but newline. This can trip you up -- you think .* matches everything, but by default it does not go past the end of a line. Note that s (whitespace) includes newlines, so if you want to match a run of whitespace that may include a newline, you can just use s* 

* `MULTILINE` -- Within a string made of many lines, allow ^ and $ to match the start and end of each line. Normally ^/$ would just match the start and end of the whole string. 
