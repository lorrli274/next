## Activity 4: Arithmetic Operations

### Increment and Decrement Operators 

By using two `+` operators in succession, `++` , variables can be incremented or decremented by values of 1.

```java
x = x + 1; 
x++;
```

Both lines of code above produce the same result, the second line of code is much cleaner and shorter. 

Decrementing the variable follows the same format except using the `--` operator. 

```java
x = x - 1;
x--;
```

Using these operators before and after the variable has an impact on the result. When using the `++` or `--` operator before a variable, we call these the **pre-increment** or **pre-decrement** operator, while using the operators after a variable are called **post-increment** and **post-decrement** operators. The difference is illustrated below. 

```java
x++; // returns x and then adds 1
++x; // adds 1 to x and then returns x

int x = 0;
int y = 0;
y = x++; // y = 0, x = 1;
y = ++x; // y = 2, x = 2;
```

In the above snippet, `x++` returns 0 before adding 1 to `x`, while `++x`  increments `x` before returning. The differences are subtle but important and paying careful attention to the appropriate use case for each can save headaches when debugging unexpected return values. 