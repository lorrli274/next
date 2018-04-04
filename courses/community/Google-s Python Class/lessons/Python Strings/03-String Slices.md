The **slice** syntax is a handy way to refer to sub-parts of sequences -- typically strings and lists. The slice s[start:end] is the elements beginning at start and extending up to but not including end. Suppose we have s = "Hello"

![](https://github.com/Codevolve/next/blob/master/courses/community/Google-s%20Python%20Class/Assets/hello.png?raw=true)

* `s[1:4]` is 'ell' -- chars starting at index 1 and extending up to but not including index 4 

* `s[1:]` is 'ello' -- omitting either index defaults to the start or end of the string 

* `s[:]` is 'Hello' -- omitting both always gives us a copy of the whole thing (this is the pythonic way to copy a sequence like a string or list) 

* `s[1:100]` is 'ello' -- an index that is too big is truncated down to the string length 

The standard zero-based index numbers give easy access to chars near the start of the string. As an alternative, Python uses negative numbers to give easy access to the chars at the end of the string: `s[-1]` is the last char 'o', `s[-2]` is 'l' the next-to-last char, and so on. Negative index numbers count back from the end of the string:

* `s[-1]` is 'o' -- last char (1st from the end) 

* `s[-4]` is 'e' -- 4th from the end 

* `s[:-3]` is 'He' -- going up to but not including the last 3 chars. 

* `s[-3:]` is 'llo' -- starting with the 3rd char from the end and extending to the end of the string. 

It is a neat truism of slices that for any index n, `s[:n] + s[n:] == s`. This works even for n negative or out of bounds. Or put another way `s[:n]` and `s[n:]` always partition the string into two string parts, conserving all the characters. As we'll see in the list section later, slices work with lists too.
