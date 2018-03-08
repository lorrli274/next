## `switch` Statements

A `switch` statement is similar to an `if / else - if` statement where a parameter is provided and evaluated against certain values. A `switch` will only work the primitive types, `byte`, `short`, `char`, `int`, and their corresponding wrapper classes (`Byte`, `Short`, `Character`, `Integer`), `Enums`,  and`Strings`.  The basic syntax for a `switch` is provided below:

```Java
switch(/*variable*/) {
    case /*value*/:
        //Some code
    case /*value*/:
        //Some code
    default:
        //Some code
}
```

While `switch` may be viewed as an alternative to `if / else - if` statements there are a couple of differences that will impact which to implement. `switch` statements scale better than `if` statements. With a large pool of evaluations it is recommeded that a`switch` be used as they are more efficient. Another `switch` advantage is that they have a more narrowed focus. `if` statements can check a varitey of conditions within an range and multiple expressions that are unrelated. 

```java
if (x == y) {
    //Some code
} else if (i == j) {
    //Some code
} else {
    //Some code
}
```

But a `switch` statement will only check the value of say `x`, against other single value conditions. 

```Java
switch(x) {
    case 1:
        System.out.println("x is equal to 1");
        break;
    case 2: 
        System.out.println("x is equal to 2");
        break;
    default: 
        System.out.println("x is not equal to 1 or 2");
        break;
}
```

In the above code block, `x` is checked against the value of 1 and against the value of 2. If one of those passes, the program will output the corresponding message. The `break` statement that is included after each expression is an important aspect of the `switch` statmement in Java. The `break` statement forces the exit of the `switch` statement, similar to a `return`. This is necessary because Java `switch` statements **fall through** - meaning that once a case condition is met, all the subsequent conditional expressions will be run until a break statement is encountered. In the above example, if `case 1:` did not have `break;` statement than the expression for `case 2:` would also be run. 

The `default` expression provided a default expression to run in the instance that non of the conditions in the `switch` statements evaluate to true. 

Below is a snippet that contains a `switch` statement, manipulate and run the code to learn more about the `switch` statement. 

```Java
// switch statement

class mySwitchStatement {
    public static void main(String[] args) {
        int x = 5;
        switch(a) {
            case 1: 
                System.out.println("The variable x is equal to 1");
                break;
            case 3: 
                System.out.println("The variable x is equal to 3");
                break;
            case 5: 
                System.out.println("The variable x is equal to 5");
                break;
            default: 
                break; 
        }
    }
}
```

