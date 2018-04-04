Gather a list of the absolute paths of the special files in all the directories. In the simplest case, just print that list (here the "." after the command is a single argument indicating the current directory). Print one absolute path per line.
    
```bash
$ ./copyspecial.py .
/Users/nparlante/pycourse/day2/xyz__hello__.txt
/Users/nparlante/pycourse/day2/zz__something__.jpg
```    

We'll assume that names are not repeated across the directories (optional: check that assumption and error out if it's violated).
