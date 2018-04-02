The module *urllib* provides url fetching -- making a url look like a file you can read from. The *urlparse* module can take apart and put together urls.
* [urllib module docs]( https://developers.google.com/edu/python/docs.python.org/library/urllib)
* ufile = urllib.urlopen(url) -- returns a file like object for that url 
* text = ufile.read() -- can read from it, like a file (readlines() etc. also work) 
* info = ufile.info() -- the meta info for that request. info.gettype() is the mime type, e.g. 'text/html' 
* baseurl = ufile.geturl() -- gets the "base" url for the request, which may be different from the original because of redirects 
* urllib.urlretrieve(url, filename) -- downloads the url data to the given file path 
* urlparse.urljoin(baseurl, url) -- given a url that may or may not be full, and the baseurl of the page it comes from, return a full url. Use geturl() above to provide the base url. 

In Python 3, urllib and urllib2 are merged into urllib.request, and urlparse becomes urllib.parse. All of their exceptions are in urllib.error.
    
```    
## Given a url, try to retrieve it. If it's text/html,
## print its base url and its text.
def wget(url):
  ufile = urllib.urlopen(url)  ## get file-like object for url
  info = ufile.info()   ## meta-info about the url content
  if info.gettype() == 'text/html':
    print 'base url:' + ufile.geturl()
    text = ufile.read()  ## read all its text
    print text
```

The above code works fine, but does not include error handling if a url does not work for some reason. Here's a version of the function which adds try/except logic to print an error message if the url operation fails.
The above code works fine, but does not include error handling if a url does not work for some reason. Here's a version of the function which adds try/except logic to print an error message if the url operation fails.
    
```    
## Version that uses try/except to print an error message if the
## urlopen() fails.
def wget2(url):
  try:
    ufile = urllib.urlopen(url)
    if ufile.info().gettype() == 'text/html':
      print ufile.read()
  except IOError:
    print 'problem reading url:', url
```
