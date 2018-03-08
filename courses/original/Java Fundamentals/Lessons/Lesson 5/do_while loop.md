## `do / while` loop

A `do / while` loop is used to continuously run code until a condition is met. 

```Java
do {
    // Some code
} while (/*expression*/)
```

The code inside the `do` block will execute continuous until the specified condition evaluations to `true`. `do / while` loops can be used to perform a function until a user enters a certain command into the console, until a variable equals a certain value, or a function returns the expected result. 

## `while`

Alternatively you can use a `while` loop in a standalone manner. 

```Java
while (/*expression == false*/) {
    // Some code
}
```

Even though the two loops are similar there is one major difference between the two. A `while` evaluates the condition before running the code in its scope. If this evaluates to false, the code block is never run. In a `do / while` loop, the expression in the `do` block will run at least once before the expression is evaluated. 



## Infinite loop

A common logic error can occur with loops that are not terminated properly called the **infinite loop**. The infinite loop will run continuous (forever), until the program crashes, runs out of resources, or is forced into a hard stop / shutdown manually. An infinite loop can occur when the expression to be evaluated never evaluates to true. 

```Java
int x = 2;
while (x != 1) {
    ++x;
}
```

The code above will never evaluate to true since the `x` is already greater than `1`. `++x` will run until the program crashes, or it is forced to shut down. 

## Sentinel Value

One way to run a loop continously without provided an explicit expression to be evaluated with pre determined value is to use a **sentinel value**. A sentinel value is a value that once provided breaks the loop. In the snippet below, a sentinel value is provided to the program by the user. If the value **0** is not entered, the `do / while` loop will continue run. 

Use the snippet below to experiment with the `do / while` loop. Change the `do / while` code block, change the sentinel value, and change the condition inside the `while` expression. 

```Java
// do / while loop example

import java.util.Scanner;

class myDoWhileExample {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int x = 0;
        do {
           ++x; 
           System.out.println(String.format("This loop has run %d times", x));
        } while (input.nextInt() != 0) // sentinel value
    }
}
```

