Complete the `read_urls(filename)` function that extracts the puzzle urls from inside a logfile. Find all the **puzzle** path urls in the logfile. Combine the path from each url with the server name from the filename to form a full url, e.g. "http://www.example.com/path/puzzle/from/inside/file". Screen out urls that appear more than once. The `read_urls()` function should return the list of full urls, sorted into alphabetical order and without duplicates. Taking the urls in alphabetical order will yield the image slices in the correct left-to-right order to re-create the original animal image. In the simplest case, `main()` should just print the urls, one per line.
    
```bash    
$./logpuzzle.py animal_code.google.com
http://code.google.com/something/puzzle-animal-baaa.jpg
http://code.google.com/something/puzzle-animal-baab.jpg
...
```
