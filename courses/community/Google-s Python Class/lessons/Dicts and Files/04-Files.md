The `open()` function opens and returns a file handle that can be used to read or write a file in the usual way. The code f = open('name', 'r') opens the file into the variable f, ready for reading operations, and use `f.close()` when finished. Instead of 'r', use 'w' for writing, and 'a' for append. 

The special mode 'rU' is the "Universal" option for text files where it's smart about converting different line-endings so they always come through as a simple 'n'. The standard for-loop works for text files, iterating through the lines of the file (this works only for text files, not binary files). The for-loop technique is a simple and efficient way to look at all the lines in a text file:
    
```python    
# Echo the contents of a file
f = open('foo.txt', 'rU')
for line in f:   ## iterates over the lines of the file
  print line,    ## trailing , so print does not add an end-of-line char
                 ## since 'line' already includes the end-of line.
f.close()
```

Reading one line at a time has the nice quality that not all the file needs to fit in memory at one time -- handy if you want to look at every line in a 10 gigabyte file without using 10 gigabytes of memory. 

The `f.readlines()` method reads the whole file into memory and returns its contents as a list of its lines. The `f.read()` method reads the whole file into a single string, which can be a handy way to deal with the text all at once, such as with regular expressions we'll see later.

For writing, `f.write`(string) method is the easiest way to write data to an open output file. Or you can use "print" with an open file, but the syntax is nasty: `"print >> f, string"`. In python 3000, the print syntax will be fixed to be a regular function call with a file= optional argument: `"print(string, file=f)"`.
