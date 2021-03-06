## Activity 4: Arithmetic Operations

## Modulo

Modulo is a division where the desired result is the remainder. In modulo *15 / 5 = 3 r 0*, the answer is **0** and not **3**. 

Modulo operator is the `%` sign. This will return the remainder of the operation. 

Use the snippet below to practice some Modulo math.

```java
public class Modulo {
    public static void main(String[] args) {
        
        int answer = 0;
        int value1 = 5;
        int value2 = 3;
        int value3 = 9;

        answer =  // answer = 
        answer =  // answer = 
        answer =  // answer = 
    }
}
```



## Convenience Assignment Operators

As we know the assignment operator `=` is used to assign a value to variables or constants. There are in fact a few variations of this operator. One that can initially confuse beginners is the **comparison operator** `==`. Where the assignment operator assigns a value to a variable or constant, the comparison operator compares the reference in memory of the two values and returns a Boolean if they reference the same location in memory. For value equality comparisons, the `.equals()` method of the <u>wrapper classes</u> can be used to compare the value of two objects. 

```java
// Demonstrates the difference between =, ==, and equals()
public class myOperatorExample {
    public static void main(String[] args) {
        Integer value1 = 10;
        Integer value2 = value1;
        Integer value3 = 10;
        System.out.println(value1 == value2); // true
        System.out.println(value1 == value3); // false
        System.out.println(value1.equals(value3)); // true
    }
}
```

Remember that the `.equals()` method is only available in a wrapper class.

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     