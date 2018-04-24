The Copy Special exercise goes with the file-system and external commands material in the Python Utilities step.

The *copyspecial.py* program takes one or more directories as its arguments. We'll say that a "special" file is one where the name contains the pattern `w` somewhere, where the `w` is one or more word chars. The provided `main()` includes code to parse the command line arguments, but the rest is up to you. Write functions to implement the features below and modify main() to call your functions.

Suggested functions for your solution:

* get_special_paths(dir) -- returns a list of the absolute paths of the special files in the given directory 
* copy_to(paths, dir) given a list of paths, copies those files into the given directory 
* zip_to(paths, zippath) given a list of paths, zip those files up into the given zipfile 

