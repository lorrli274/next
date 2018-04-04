The `commands` module is a simple way to run an external command and capture its output.

* [commands module docs](https://docs.python.org/2/library/commands)

* (status, output) = commands.getstatusoutput(cmd) -- runs the command, waits for it to exit, and returns its status int and output text as a tuple. The command is run with its standard output and standard error combined into the one output text. The status will be non-zero if the command failed. Since the `standard-err` of the command is captured, if it fails, we need to print some indication of what happened. 

* output = `commands.getoutput`(cmd) -- as above, but without the status int.

* There is a `commands.getstatus()` but it does something else, so don't use it -- dumbest bit of method naming ever!

* If you want more control over the running of the sub-process, see the ["popen2" module](https://docs.python.org/2/library/popen2.html)

* There is also a simple os.system(cmd) which runs the command and dumps its output onto your output and returns its error code. This works if you want to run the command but do not need to capture its output into your python data structures.

>Note: The commands module and the popen2 module are deprecated as of Python 2.6 and removed in 3.x. The [subprocess module]( https://developers.google.com/edu/python/docs.python.org/library/subprocess) replaces these modules. In particular, the subprocess module discusses replacements for these modules in the [subprocess-replacements section](https://developers.google.com/edu/python/docs.python.org/library/subprocess.html#subprocess-replacements).
    
```python    
## Given a dir path, run an external 'ls -l' on it --
## shows how to call an external program
def listdir(dir):
  cmd = 'ls -l ' + dir
  print "Command to run:", cmd   ## good to debug cmd before actually running it
  (status, output) = commands.getstatusoutput(cmd)
  if status:    ## Error case, print the command's output to stderr and exit
    sys.stderr.write(output)
    sys.exit(status)
  print output  ## Otherwise do something with the command's output
```
