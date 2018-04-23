## File Output

File output is a useful function for almost any program. File output can be used to share data with other applications, transfer information easily via a medium such as email, or store large amounts of infrequently accessed data. 

File output in Java usually consists of a `String` or an array of `String`s that are written to a file. A `Path` instance is created, containing the filepath and name of the destination file. If it does not exist, a new file is created. The `Files` class contains a method called `.write()` that will write the data to the destination file. You can also use a `FileOutputStream`, similar to *File Input*. This snippet will cover both options. 

````java
// Program demonstrates writing the contents of String to a file
/*
	For more information about the individual frameworks in the `java.io` library visit: https://docs.oracle.com/javase/7/docs/api/java/io/package-summary.html
	For many projects, it may be a good idea to explicity import the classes that a program will use instead of the entire framework. 
*/
import java.io.*;
public class MyFileWriter {
    public static void main(String[] args) {
        writerOption1();
        writerOption2();
    }
    
    private void writerOption1() {
        String myContent = "Lorem ipsum dolor sit amet"; 
        Path filePath = new Path.get("Option1.txt");
        Files.write(filePath, myContent, Charset.forName("UTF-8"));
    }
    
    private void writerOption2() {
        String myContent = "consectetur adipiscing elit"; 
        Path filePath = new Path.get("Option2.txt");
        FileOutputStream fos = new FileOutputStream(filePath);
        fos.write(myContent);
        fos.close();
    }
}
````

The above snippet shows two different ways of writing information to a file. Use the editor on the right to view the contents of the file. Manipulate the `String` s and run the program again to view the changes to the file. Try creating different files to write to.