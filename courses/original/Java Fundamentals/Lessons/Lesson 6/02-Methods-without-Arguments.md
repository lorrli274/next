## Methods without Arguments

All methods follow the same basic structure. Methods without arguments simply have no arguments inbetween the `()` . 

```Java
// This method does something
private void foo() {
    // Some code
}
```

Below is a snippet that contains two functions, `foo()` and `bar()`. One thing to note in the below snippet is that the `static` keyword is listed for both functions. Java has a variety of rules that must be followed that over time and with experience and practice will become more apparent. One of those rules is that non-static methods cannot be referenced from a `static` context, in this case the`static` method `main` cannot access non-static methods. This is becuase non-static methods are tied to distinct instances of their corresponding objects, wheras `static` methods share an instance that can be referenced. 

Manipulate the code within the functions and within the body of the `main` to learn how to write and implement functions. Try removing the `static` keyword to observe the impact it has on the output. 

```java
// Demonstration of calling methods in a program
class MyFunctionDemo {
    public static void main(String[] args) {
        // calling functions
        foo();
        String s = bar();
        System.out.println(s);
        // Because function bar() returns a String, it can be used where the return value would be used, in this case as the argument for `println()`
        System.out.println(bar());
    }
    // A function with no parameters or return type
    private static void foo() {
        System.out.println("This is the function foo");
    }
    // A function with no parameters that returns a String literal
    private static String bar() {
        return "This is the function bar";
    }
}
```

