The *os* and *os.path* modules include many functions to interact with the file system. The *shutil* module can copy files.
* [os module docs](https://docs.python.org/library/os)
* filenames = os.listdir(dir) -- list of filenames in that directory path (not including . and ..). The filenames are just the names in the directory, not their absolute paths. 
* os.path.join(dir, filename) -- given a filename from the above list, use this to put the dir and filename together to make a path 
* os.path.abspath(path) -- given a path, return an absolute form, e.g. /home/nick/foo/bar.html 
* os.path.dirname(path), os.path.basename(path) -- given dir/foo/bar.html, return the dirname "dir/foo" and basename "bar.html" 
* os.path.exists(path) -- true if it exists 
* os.mkdir(dir_path) -- makes one dir, os.makedirs(dir_path) makes all the needed dirs in this path 
* shutil.copy(source-path, dest-path) -- copy a file (dest path directories should exist) 

```
## Example pulls filenames from a dir, prints their relative and absolute paths
def printdir(dir):
  filenames = os.listdir(dir)
  for filename in filenames:
    print filename  ## foo.txt
    print os.path.join(dir, filename) ## dir/foo.txt (relative to current dir)
    print os.path.abspath(os.path.join(dir, filename)) ## /home/nick/dir/foo.txt
```

Exploring a module works well with the built-in python help() and dir() functions. In the interpreter, do an "import os", and then use these commands look at what's available in the module: dir(os), help(os.listdir), dir(os.path), help(os.path.dirname).
Exploring a module works well with the built-in python help() and dir() functions. In the interpreter, do an "import os", and then use these commands look at what's available in the module: dir(os), help(os.listdir), dir(os.path), help(os.path.dirname).
