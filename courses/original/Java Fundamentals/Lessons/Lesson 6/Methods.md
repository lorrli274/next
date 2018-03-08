## Methods

Methods, or functions as they are often called, are blocks of code that designed to perform a tasks (usually one) in a particular way. Methods help group blocks of code that perform a specific function together. The structure for declaring a method is below. 

```Java
/** javadoc */
keywords type function_name(arguments) {
    // code
    return_statement
}
```

The *Hello_World* section in the introduction to this course also covered the structure and keywords of the `public static void main(String[] args) {}` found in Java programs. This chapter will cover some of the  remaining implementations of methods in Java. 

## Keywords

Method declarations have keywords that tell the compiler what type of method it is: 

1. `public` - This method is visible outside the scope of the class. 
2. `private` - This method is visible only inside the scope of the class. 
3. `static` - Memory management.  Enough memory is allocated for only one instance of the method. This prevents multiple class instances from reserving memory for duplicate instances of a method. 
4. `final` - prevents the modification (Overriding) of a method by a subclass. 
5. `void` - Indicates that the method does not return a value. This keyword can be replaced by a data type or object to indicate the return type of the method. 

## Name

These keywords are followed by a method name. Method names in Java typically follow camelCase, and usually indicate the purpose of the function, such as `private void doNothing() {};` This does not always have to be the case and it is a good idea to use <u>javadoc</u> to futher explain the purpose and the details of non-intuitive methods in a program. Often when writing about code it is common to use placeholder names such as *foo* or *bar* for the names of functions or variables. Method names, like variable names, must be keywords. 

## Arguments

Methods in Java come with and without explicit arguments. Arguments, also referred to as **parameters**, are variables that have an explicitly declared type. Arguments are accessible within the scope of the function by name. 

## Scope

The scope of a function is the area within its `{}`. Within the scope, a method has access to member variables within its parent scope, and its argument variables. However, once outside of the function, the calling method cannot access the variables inside a method. To access data from a method, the method must `return` that data to calling method. 

## Next Steps

There are three key learning points when dealing with functions: 

1. Functions without arguments
2. Functions with arguments
3. Recursion



