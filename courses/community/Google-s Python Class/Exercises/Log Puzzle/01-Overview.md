For the Log Puzzle exercise, you'll use Python code to solve two puzzles. This exercise uses the `urllib` module, as shown in the [Python Utilities](https://developers.google.com/edu/python/utilities) section. Add your code to the *logpuzzle.py* file.

An image of an animal has been broken it into many narrow vertical stripe images. The stripe images are on the internet somewhere, each with its own url. The urls are hidden in a web server log file. Your mission is to find the urls and download all image stripes to re-create the original image.

The slice urls are hidden inside apache log files (the open source [apache](http://httpd.apache.org/) web server is the most widely used server on the internet). Each log file is from some server, and the desired slice urls are hidden within the logs. The log file encodes what server it comes from like this: the log file *animal_code.google.com* is from the *code.google.com* server (formally, we'll say that the server name is whatever follows the first underbar). The *animial_code.google.com* log file contains the data for the "animal" puzzle image. Although the data in the log files has the syntax of a real apache web server, the data beyond what's needed for the puzzle is randomized data from a real log file.

Here is what a single line from the log file looks like (this really is what apache log files look like):
    
```
10.254.254.28 - - [06/Aug/2007:00:14:08 -0700] "GET /foo/talks/ HTTP/1.1"
200 5910 "-" "Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US; rv:1.8.1.4) Gecko/20070515 Firefox/2.0.0.4"
```

The first few numbers are the address of the requesting browser. The most interesting part is the "GET _path_ HTTP" showing the path of a web request received by the server. The path itself never contain spaces, and is separated from the GET and HTTP by spaces (regex suggestion: S (upper case S) matches any non-space char). Find the lines in the log where the string "puzzle" appears inside the path, ignoring the many other lines in the log.
