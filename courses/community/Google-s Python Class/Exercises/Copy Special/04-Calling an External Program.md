If the "--tozip zipfile" option is present at the start of the command line, run this command: "zip -j zipfile ". This will create a zipfile containing the files. Just for fun/reassurance, also print the command line you are going to do first (as shown in lecture). (Windows note: windows does not come with a program to produce standard .zip archives by default, but you can get download the free and open zip program from [www.info-zip.org](http://www.info-zip.org/).)
    
```bash    
$./copyspecial.py --tozip tmp.zip .


Command I'm going to do:zip -j tmp.zip /Users/nparlante/pycourse/day2/xyz__hello__.txt
/Users/nparlante/pycourse/day2/zz__something__.jpg
```

If the child process exits with an error code, exit with an error code and print the command's output. Test this by trying to write a zip file to a directory that does not exist.
    
```    
$./copyspecial.py --tozip /no/way.zip .


Command I'm going to do:zip -j /no/way.zip /Users/nparlante/pycourse/day2/xyz__hello__.txt
/Users/nparlante/pycourse/day2/zz__something__.jpg


zip I/O error: No such file or directory

zip error: Could not create output file (/no/way.zip)
```
