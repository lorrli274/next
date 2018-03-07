## Lesson 1: Basics of Java

### Constants

A constant is a variable who's value remains constant, it does not and should not change. Java does not have support for built in constants, but two keywords can be combined to accomplish this, the `static` and the `final` keywords. We have discussed the `static` keyword before and as a refresher it signals that the compiler should only allocated memory for an attribute once, but the `final` keyword may be new to you. The `final` keyword restricts the programmer's ability to change the value of the variable, thus we can create constants. 

```java
private static final float PIE = 3.14;
```

Above is an example of an declaration and initialization of the constant variable `PIE`.  Writing the constant in all caps is intentional as well. While variables are written in camelCase, it is best practice to write constants in all caps, separated by underscores. This is generally referred to as **snake_case** or **SCREAMING_SNAKE_CASE**. 

```java
public static final int MAX_LIMIT = 100;
```

The difference helps improve readability in your code. 


