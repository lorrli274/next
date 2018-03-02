# Which Python?

For this course you will use Python 3.5, which the latest version of Flask is compatible with!

You can see what version of Python is installed by starting the Python interpreter with the `python3` command:

```
$ python3
Python 3.5.2 (default, Nov 23 2017, 16:37:01)
[GCC 5.4.0 20160609] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> 
```

Here you can see it is version `3.5.2`.

# pip

Python comes with a lot of built-in functionality in the form of **packages**. However, Python doesn't come with everything you might need. You can extend Python by adding new modules, which come bundled up in packages.

The `pip` command uses the [Python Packages Index](https://pypi.python.org/pypi) to install new Python packages made by others. This makes it super-easy to install Flask and other packages that you might want to use in future, for example [Twitter](https://pypi.python.org/pypi/twitter) (to access the Twitter API to request data about Twitter) or [bashplotlib](https://pypi.python.org/pypi/bashplotlib) (to plot data on a graph in your terminal.)

# Installing Flask

So far as website frameworks go, Flask has a minimal number of libraries that it needs to run. Though it would be possible to find and install all these libraries manually it is much easier to use the `pip3` command.

Now that everything is set up, installing Flask is as easy as:

```
$ pip3 install flask
```
Flask is now installed and ready to go!
