## Methods with Arguments

Methods that contain arguments will have them listed within the `()` of the declaration. 

```java
// This method does something
private int foo(int num1, int num2) {
    // Some code
    return num1 + num2;
}
```

In the above code block, `num1` and `num2` are arugments for `foo()`, which returns an `int` value. Arguments do not need to be of the same type, and they can be objects, both system and custom. `num1` and `num2` are accessible within the scope of the function `foo`, but not outside the `{}`. 

Manipulate the code within the functions and within the body of the `main` to learn how to write and implement functions. Try removing the `static` keyword to observer the impact it has on the output. 

```java
// Demonstration of calling methods in a program
import java.util.Scanner;

class MyFunctionDemo {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        // calling functions
        foo(3, 2);
        System.out.println("Enter a string or number:");
        String s = bar(input.next());
        System.out.println(s);
    }
    // A function with no parameters or return type
    private static void foo(int num1, int num2) {
        int num3 = num1 * num2; 
        System.out.println(num3);
    }
    // A function with no parameters that returns a String literal
    private static String bar(String arg) {
        return String.format("The input that was entered as an argument is `%s`", arg);
    }
}
```

