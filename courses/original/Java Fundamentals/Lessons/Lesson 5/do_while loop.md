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

A common logic error can occur with loops. The **infinite loop**. The infinite loop will run continuous forever, until the program crashes or is forced into a hard stop / shutdown. An infinite loop can occur when the expression to be evaluated never evaluates to true. 

```Java
int x = 2;
while (x != 1) {
    ++x;
}
```

The code above will never evaluate to true since the `x` is already greater than `1`. `++x` will run until the program crashes, or it is forced to shut down. 

