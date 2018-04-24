## Lesson 1: Basics of Java

## Variables

Variables in Java represent spaces of memory in a human readable format, almost always English,  that contain a value.  Variables are declared using keywords such as `String` or `int` and then are assigned a value using the assignment operator `=` .  A variable is declared with a name and then initialized with a value. Variable names start with a lower case letter and can contain digits, an underscore or a dollar sign. 

> info You do not have to start a variable name with a lower case letter, but most everything else is discouraged. The standard naming conventions in Java are **camelCase**. 

 Variables that do not contain a value are assigned the value of `null`.

 Take a look at the code block below to get feel for the syntax and some of the different data types in Java:

```java
String myString = "This is a string literal";
int myInt = 10;
double myDouble = 1.2;
Boolean myBool = false; 
```

Variables are mutable, this means that their value can change and mutate throughout the lifecycle of a program, hence the name *variable*. 
