## Type Casting

**Type Casting** is the process by which an object or type is converted to another using an **explicit** type declaration or **implicit** syntax. 

Explicit casting is when the programmer explicitly tells the compiler what to convert a value to before assigning it. Implicit casting allows the compiler to determine the intended type using local context clues. 

```Java
// Type Casting Example
/*
	Demonstration of basic type casting
*/ 
public class TypeCastDemo {
    public static void main(String[] args) {
        int myInt = 3333;
        double myDouble = myInt; // Implicit cast
        myInt = (int) myDouble; // Explicit cast
        myInt = Integer(myDouble); // Explicit
    }
}
```

In the example above, we explicitly and implicit convert `myInt` to a `double` and back to an `int`. When you are casting one object to another using explicit casting you are calling the constructor of the exlicitly declared type, this can help avoid some of the unexpected results from casting using the implicit syntax. Behind the scenes, the compiler In the example above is assigning a new `Integer` object iniitialized via its constructor to the value of the `myDouble`.  

When using implict casting it is import to note that you can only cast types to a larger type (in memory). Review the snippet on <u>Data Types</u> for a refresher on memory allocation. The compiler will not type cast a `double` to a `byte`, or an `int` to a `byte` implicitly. If we want to cast from a smaller type to a larger type, we need to use explicit type casting. 

Casting is an important concept to keep in mind when creating classes that inherit from the same hierrarchy and which type of casting will be needed to when casting among the child classes. 