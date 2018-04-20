The power of regular expressions is that they can specify patterns, not just fixed characters. Here are the most **basic patterns** which match single chars:

* `a, X, 9, < \`-- ordinary characters just match themselves exactly. The meta-characters which do not match themselves because they have special meanings are: . `^`, `$`, `*`, `+`, `?`, `{`, `[ ]`, `|` and `( )`

* `. (a period)`: Matches any single character except newline 'n' 

* Lowercase `w`: Matches a `word` character. A letter or digit or underbar `[a-zA-Z0-9_]`. Although `word` is the mnemonic for this, it only matches a single word char, not a whole word. `W` (upper case `W`) matches any non-word character. 

* `b`: Boundary between word and non-word 

* Lowercase `s`: Matches a single whitespace character. Space, newline, return, tab, form `[ nrtf]`. `S` (upper case `S`) matches any non-whitespace character. 

* `t, n, r`: Tab, newline and return 

* `d`: Decimal digit `[0-9]` (some older regex utilities do not support but `d`, but they all support `w` and `s`) 

* `^ = start, $ = end`: Match the start or end of the string 

* `\`: Inhibit the "specialness" of a character. So, for example: use `\` to match a period or `\\` to match a slash. If you are unsure if a character has special meaning, such as `@`, you can put a slash in front of it, `@`, to make sure it is treated just as a character. 
