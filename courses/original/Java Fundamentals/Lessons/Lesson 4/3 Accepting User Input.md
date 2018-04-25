## Accepting User Input

A lot of program need to have some interactive functionality to function properly. This can be accepting user input, receiving commands from the web, or receiving values from other programs. A program must be able to handle and parse this information in order to function. 

Java has a few different ways of accepting user input, including GUI interfaces which are covered in ***Java GUI Concepts*** course. This section will cover accepting user input through the console using the `Scanner` object. 

The `Scanner` object can be imported using the ...

```java
import java.util.Scanner;
```

… statement at the start of the file. This will give the file access to the `Scanner` object. 

To create a interface that is capable of accepting user input, a variable that contains the `Scanner` is created: 

```java
Scanner input = new Scanner(System.in);
```

The program can now prompt the user for input by calling: 

```java
input.next();
// or 
input.nextInt();
// or
input.nextLine();
// or 
input.nextByte();
// or 
// many other methods
```

A complete list of methods and their use case can be found in the Java documentation: 

https://docs.oracle.com/javase/7/docs/api/java/util/Scanner.html. 

Below is a snippet that contains a class that prompts the user for some information. Run the code and interact with the snippet. Once that is complete, change the up the `input` methods to accept different types of input, try and perform some mathematical operations using the skills taught in **Chapter 3: Arithmetic and Operations**. Notice what happens if the program cannot parse the input? Take a quick look at this section on **<u>parsing user</u>** input to understand why this is happening and the methods that can be employed to prevent these issues. 

```java
// Demonstates a program that accepts user input
import java.util.Scanner;
public class InteractiveProgram {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("Please enter your first name");
        String fName = input.next();
        System.out.println("Hello, " + fName);
    }
}
```



 