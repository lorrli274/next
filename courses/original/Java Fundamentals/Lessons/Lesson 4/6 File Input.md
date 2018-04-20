## File Input

The ability for a program to read external files is incredibly important. This functionality can be used to read files from other programs, store large amounts of data, analyze file attributes, or parse forms and information to automate tasks and improve user experience. 

Java has a few different classes that can perform file input. This snippet will explore the use of the `InputStream` and `BufferedReader` classes in combination to read in the contents a file. 

## Reading in a file

```java
// Program demonstrates reading in the contents of file 
/*
	For more information about the individual frameworks in the `java.io` library visit: https://docs.oracle.com/javase/7/docs/api/java/io/package-summary.html
	For many projects, it may be a good idea to explicity import the classes that a program will use instead of the entire framework. 
*/
import java.io.*;
public class MyFileReader {
    public static void main(String[] args) {
       // create a new InputStream with filepath of the file that is going to be readin
       InputStream in = new InputStream("root/sandbox/filename.txt");
        // InputStream reads a file byte for byte and returns an Int
        BufferedReader br = new BufferedReader(new InputStreamReader(in));
        // StringBuilder is used to concatenate the contents of the file as they are read in
        StringBuilder fileContents = new StringBuilder();
        // nLine will be used to store the line read by `br`
        String nLine = "";
        while(nLine = br.readLine() != null) {
            fileContents.append(nLine);
        }
        System.out.println(fileContents);
        // remember to close the BufferedReader once it is no longer neeeded to free up system resources. 
        br.close();
    }
}
```

Use the above code as a template to manipulate the contents of the `.text` file that is read into the program. Change around the output of the snippet to create a new program that does something unique with the code. Try implementing some of the other methods of the `BufferedReader` class. https://docs.oracle.com/javase/7/docs/api/java/io/BufferedReader.html

##  

