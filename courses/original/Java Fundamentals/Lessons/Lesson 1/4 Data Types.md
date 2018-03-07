##Lesson 1: Basics of Java

### Data Types

A **Data Type** classification is a way to tell the compiler what type of data will be stored in a variable. This helps the compiler allocate enough memory for the data you intend to store, the functions available to that the data, and the added benefit linting and debugging. (Linting is the process by which an IDE is able to offer suggestions, bug warnings, auto-completion and can help in the development of your program).   Java is an explicit language, not implicit. If you have experience in a language such as Python, or Swift the compiler infers the language of each variable depending on the value you assign it. This is not the case in Java and each type must be explicitly declared. 

There are an assortment of primitive data types available in Java, a few of the most common are  `char`, `int` `short`, `long`, `double`, `float`, `boolean`. 

```java
private int myInt = 10;
private char myChar = "a";
private static final float MY_FLOAT = 1.2;
private boolean myBool = false; 
private static final String MY_STRING = "This is a string";
```

Above, you can see the syntax for declaring and initializing variables with their data types. This should look familiar to you. The last constant in the example above is not a primitive data type, it is a `String` and a `String` is an **array** of `char` elements. We will learn more about `Strings` in a later section.  



Below is a table that lists out all the 8 different primitive data types in Java with a brief description of the data type. 

| Data Type | Description                              |
| --------- | ---------------------------------------- |
| byte      | an 8-bit signed two's complement integer. |
| short     | 16-bit signed two's complement integer.  |
| int       | 32-bit signed two's complement integer.  |
| long      | 64-bit signed two's complement integer.  |
| float     | single precision 32-bit IEEE 754 floating point. |
| double    | double-precision, 64-bit IEEE 754 floating point. |
| boolean   | two possible values, *true*, or *false*. |
| char      | single 16-bit Unicode character.         |

For the full description of each data type please read Oracle's documentation on primitive data types, the link is posted below:

https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html







## 

