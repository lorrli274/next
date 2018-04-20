## Activity 4: Arithmetic Operations

### Multiplication 

Multiplication in Java uses the `*` operator to tell the compiler that two numbers need to be multiplied together. 

```java
answer = value1 * value2
```

```java
public class Multiplication {
    public static void main(String[] args) {
        
        int answer = 0;
        int value1 = 5;
        int value2 = 3;
        int value3 = 9;

        answer = value1 * value2; // answer = 15
        answer = value1 * value2 * value3; // answer = 135
        answer = 10 * value2; // answer = 30
    }
}
```

Feel free to add in the `Scanner.out.println()` function to view the results in the terminal. 

### Division

Let's do something a little different for division. In the snippet below you find common algebraic equations that use multiple forms of mathematical operators to get a result. Each example shows a slightly different way of writing the same example and the result each option will have the `answer`. Included in the equation is the `/` operator used for division. 

```java
public class Division {
    public static void main(String[] args) {
        
        int answer = 0;
        int value1 = 5;
        int value2 = 3;
        int value3 = 9;

        answer = value1 * value2 + value9 / value2; // answer = 
        answer = (value1 * value2) + (value9 / value2); // answer = 
        answer = value1 * (value2 + value9) / value1; // answer = 
    }
}
```

Run the snippet and maybe add in some `Scanner.out.println()` statements to view the output in the terminal. Change the value of the variables and observe the output. Ensure that you are comfortable with the `/` operator. 

As you can see, you can group portions of the equation in parenthesis to change the order of operations on the equation. It can be common for simple mathematical errors to occur when parenthesis are left out or are grouping the wrong values and it is important to pay careful attention to where they are and the result that they produce (Something we will cover in ***Chapter 9: Testing and Debugging*** when we discuss **<u>unit testing</u>**). 

