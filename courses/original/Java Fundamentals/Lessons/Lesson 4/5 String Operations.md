## Slicing, Concatenating, Addresses

`String` objects can be manipulated so that only portions of the string are returned, this is called **slicing**. Slicing can be used to shorten senteces, extract words, or address, names, etc and store only that **range** in a new `String`. A range indicates a a set of indices in an array from `i` to `i+x` where `i` is the starting index. A `String` can also be **split**. Using `.split` slices a `String` each time it comes across a certain `char`, such as a `,` or `_`, or `\` and returns a `String` array. 

```java
// Slicing Examples
/*
	Demonstrate slicing on a String object
*/
public class SlicingExamples {
    public static void main(String[] args) {
        String myFirstString = "C://Users/User1/myFolder/myFile";
        String mySecondString = "10.10.10.1";
        String myFile = myFirstString.substring(myFirstString.indexOf("myFile"), myFirstString.legnth());
        String myNetwork = mySecondString.split(".");
    }
}
```

In the above snippet, both the `.substring()` and `.split()` methods are implemented. The`.substring()` method takes two parameters, a starting index, and a ending index. Remember, since a `String` object is an array of `char` you can treat its characters like you would in an array. The `.substring()` method will return the string between these two indices. In this example it will return the name of the file only. 

The second method, `.split()` will return an array of `String` objects based. In this example, we will get an array that contains 4 elements. 

`String`s are used to store filenames, server address, web addresss, basic information such as physical address, names, options, and even the contents of entire files. It is important to understand how to manipulate `String`s to extract the information necessary. 

**Concatenation** is the process by which two or more `String` objects are combined to form one `String`. 

```Java
// Concatenation Example
/*
	Demonstrate concatenation on multiple String objects
*/
public class ConcatExample {
    public static void main(String[] args) {
        String alpha = "abcdefghijklm";
        String bet = "nopqrstuvwxyz";
        String alphabet = alpha + bet + ".";
        System.out.println(alphabet);
    }
}
```

Concatenation in Java is simple, using the `+` operator we can combine two or more `String`s to create one `String`. 

Being able to apply these operations  to `String` objects can help ease the transition from computer code to user facing text where the presentation can impact user experience but the content is still important, for example, would you want to present `C://User/Me/Documents/Folder1/Folder2/file.txt` or simply `file.txt`? The `file.txt` can be sliced out of the file path, and after the user has made a selection the `file.txt` can be concatenated to the path to create the **full path**. 