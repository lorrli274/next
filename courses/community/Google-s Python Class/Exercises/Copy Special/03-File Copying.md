If the "--todir dir" option is present at the start of the command line, do not print anything and instead copy the files to the given directory, creating it if necessary. Use the python module "shutil" for file copying. 
    
```bash    
$ ./copyspecial.py --todir /tmp/fooby .
$ ls /tmp/fooby
xyz__hello__.txt        zz__something__.jpg
```
