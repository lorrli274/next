The Copy Special exercise goes with the file-system and external commands material in the [Python Utilities](https://developers.google.com/edu/python/utilities) section. This exercise is in the "copyspecial" directory within google-python-exercises (download [google-python-exercises.zip](https://developers.google.com/edu/python/google-python-exercises.zip) if you have not already, see [Set Up](https://developers.google.com/edu/python/set-up) for details). Add your code in copyspecial.py.

The copyspecial.py program takes one or more directories as its arguments. We'll say that a "special" file is one where the name contains the pattern __w__ somewhere, where the w is one or more word chars. The provided main() includes code to parse the command line arguments, but the rest is up to you. Write functions to implement the features below and modify main() to call your functions.

Suggested functions for your solution(details below):

* get_special_paths(dir) -- returns a list of the absolute paths of the special files in the given directory 
* copy_to(paths, dir) given a list of paths, copies those files into the given directory 
* zip_to(paths, zippath) given a list of paths, zip those files up into the given zipfile 

