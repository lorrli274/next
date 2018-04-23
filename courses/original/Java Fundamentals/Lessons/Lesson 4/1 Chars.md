### Char

A `char` is a primitive data type that makes up the basic structure of a `String`. A `char` can hold the value of one Unicode character, such as 'a', 'b', 'c' and it will contain its corresponding Unicode value.  

```java
char myChar1 = 'a'; // 97
char myChar2 = 'A'; // 65
```

Because a `char` stores a Unicode character value it can be added to other `char`s to produce a result in the form of an `int`. Likewise, `char` and `int` types can be added together to manipulate the value of the `char`. 

```java
// Shift Example
/*
	An example in using Integers to shift the value of chars
*/
public class shiftChar {
  public static void main(String[] args) {
    char lowerA = 'a'; // 97
    char upperB = 'B'; // 66
    System.out.print(lowerA + 3); //100, d
    System.out.print(upperB - 3);
  }
}
```

Java has a `Character` object, which is know as **<u>Wrapper Class</u>**.  The `Character` wrapper class provides the `char` type with functionality that mimic the OOP fundamentals of a class, such as built in methods, that can be performed on the `char`.

```java
// Character Example
/*
	An example of the Character object and its methods
*/

public class CharacterExampler {
  public static void main(String[] args) {
    char a = 'a';
    boolean b = false;
   	b = Character.isDigit(a); // Determines if the specified Character 'a' is a digit
    b = Character.isLetter(a); // Determines if the specified Character 'a' is a letter
    b = Character.isUpperCase(a); // Determines if the specified Character 'a' is upper case
    b = Character.isLowerCase(a); // Determines if the specified Character 'a' is lower case
  }
}
```

These are only four of the methods that become available when using the `Character` object. These methods can become useful when dealing with `char` values that have been provided to the program, when filtering `String`s, accepting user input, reading in the contents of a file, and file output, verifying email characters, ect...