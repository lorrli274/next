### Strings

A`String` is an obect that contains an array of `char` elements. This allows the program to store information and data that can be printed or displayed in a readable format if the data is legible to begin with. Instead of storing data in dozens or hundreds of `char` variables or constants, we can store them all in one data type. 

```java
String myString = "abc";
char char1 = "a";
char char2 = "b";
char char3 = "c";
```

As you can see, it is much easier and cleaner to store "abc" in a `String` than it is to store them in `char` variables, or a `char` array.  A `String` is essential to input and output operations in Java. A `String` that is declared outright, as seen below is called a **string literal**. `String` literals are a fixed length and are immutable once created. Concatenation is supported in Java, so a `String` can be created by adding two strings together using the `+` operator. In the below example, the `"bar"` in the `println()` is a string literal, or an anonymous string. It cannot be reference again in the program without explicitly typing the value again. 

```Java
public class StringExample {
  public static void main(String[] args) {
    String foo = "foo"; 
	System.out.println(foo + "bar"); 
  }
}
```

Run the block above to see the output generated by the concatenation. 

SInce the `String` object is an object and not a data type it has methods that can be called on itself. 

```Java
//String Method Demo
/*
	Demo some of the methods within the String class
*/
public class StringMethodDemo {
  public static void main(String[] args) {
    String myString = "Lorem ipsum";
    int myInt = myString.length(); // returns the length of the string as an int
    String lowerCase = myString.toLowerCase(); // returns the string in all lowercase letters
    myString = myString.trim(); // removes all the whitespace
  }
}
```

All the methods of the `String` class can be found in the Java documentation https://docs.oracle.com/javase/7/docs/api/java/lang/String.html. Take some time to read through the `String` documentation and practice using the methods in the code snippet above. 