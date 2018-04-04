Complete the download_images() function which takes a sorted list of urls and a directory. Download the image from each url into the given directory, creating the directory first if necessary (see the "os" module to create a directory, and "urllib.urlretrieve()" for downloading a url). Name the local image files with a simple scheme like "img0", "img1", "img2", and so on. You may wish to print a little "Retrieving..." status output line while downloading each image since it can be slow and its nice to have some indication that the program is working. Each image is a little vertical slice from the original. How to put the slices together to re-create the original? It can be solved nicely with a little html (knowledge of HTML is not required).

The download_images() function should also create an **Index.html** file in the directory with an "img" tag to show each local image file. The img tags should all be on one line together without separation. In this way, the browser displays all the slices together seamlessly. You do not need knowledge of HTML to do this; just create an index.html file that looks like this:

```
<verbatim>
<html>
<body>
<img src="/edu/python/exercises/img0"><img src="/edu/python/exercises/img1"><img src="/edu/python/exercises/img2">...
</body>
</html>
```

Here's what it should look like when you can download the animal puzzle:

```bash
$ ./logpuzzle.py --todir animaldir animal_code.google.com
$ ls animaldir
img0  img1  img2  img3  img4  img5  img6  img7  img8  img9  index.html
```
When it's all working, opening the index.html in a browser should reveal the original animal image. What is the animal in the image?

