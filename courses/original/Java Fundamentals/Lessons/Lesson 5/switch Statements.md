## `switch` Statements

A `switch` statement is similar to an `if / else - if` statement where a parameter is provided and evaluated against certain values. A `switch` will only work the primitive types, `byte`, `short`, `char`, `int`, their corresponding wrapper classes (`Byte`, `Short`, `Character`, `Integer`), `Enums`,  and`Strings`.  The basic syntax for a `switch` is provided below:

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