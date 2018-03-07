###Wrapper Classes

A **Wrapper Class** is one of eight classess in Java designed to support a corresponding primitive data type. Each primitive data type has a wrapper class which provides the type with class like functionality, such as methods.

Below is a table of the primitive data types and their corresponding wrapper class:

| Data Type | Wrapper Class |
| --------- | ------------- |
| boolean   | Boolean       |
| byte      | Byte          |
| char      | Character     |
| int       | Integer       |
| float     | Float         |
| double    | Double        |
| long      | Long          |
| short     | Short         |

Each class comes with a series of methods that can be used on the data type, these ususally included common method operations similar to `.isUpperCase()`, or `.parseInt()`. A full list of wrapper class methods are contained within the Java documentation on each class. There are several methods to each class and too numerious to cover here. It is well worth the investment to review each class and their methods to get a sense of what each class offers to each its corresponding data type. 

Primitive data types can simply hold data, if we want to avoid writting additional code to support each type, we call a wrapper class and its corresponding method. 

```java
//Wrapper Classes
/*
	Demo of how to declare and use wrapper classes to perform methods on primitive data types. 
*/

public class WrapperDemo {
  public static void main(String[] args) {
    int myString = "12";
    int myInt = Integer.parseInt(myString); //Returns the value of the argument, if the argument is not convertible to decimal format this method will throw a NumberFormatException
    System.out.println(myInt);
  }
}
```

In fact, even calling `System.out.println(myInt);` calls the wrapper method `.toString()` on `myInt` to convert the `int` to a `String` to output the value to the console. 