Suppose instead of printing the text to standard out, we want to write files containing the text. If the flag *summaryfile* is present, do the following: For each input file `foo.html`, instead of printing to standard output, write a new file `foo.html.summary` that contains the summary text for that file.

Once the *--summaryfile* feature is working, run the program on all the files using * like this: `./babynames.py --summaryfile baby*.html`. This generates all the summaries in one step. 

info> The standard behavior of the shell is that it expands the _baby*.html_ pattern into the list of matching filenames, and then the shell runs *babynames.py*, passing in all those filenames in the `sys.argv` list.

With the data organized into summary files, you can see patterns over time with shell commands, like this:
    
```bash    
$ grep 'Trinity ' *.summary
$ grep 'Nick ' *.summary
$ grep 'Miguel ' *.summary
$ grep 'Emily ' *.summary
```    

info> Regular expression hints -- year: r`Popularitysins(dddd)` names: r`(d+)(w+)(w+)`
