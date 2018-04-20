## `Math` Module and Floating Point Math

## `java.lang.math`

When wanting to perform more advanced mathematical evaluations in code, using the `+`, `-`, `*`,  and `/` operators will only get you so far. Java comes with a useful module, `java.lang.math` (and many more) that includes methods to perform some more advanced operations, such as exponential, square root, and some trigonemtric functions. To import the `java.lang.math` library, use the `import` statement at the top of your file. 

```java
import java.lang.math;
```

An entire list of methods and their documentation for the `java.lang.math` module can be found in the Oracle documentation: <https://docs.oracle.com/javase/8/docs/api/java/lang/Math.html/>

Take a moment to read throught the documentation as it lists several commonly used functions such as `abs()`, `random()`, `log()`, and `pow()`. 

Below, is a snippet containing some of the functions in the `java.lang.math` module. Java uses a technique called **dot notation** to call functions and methods of classes. To use a function or method of the `.math` module you "call" that function by using a `.`:  `Math.random()`, `Math.abs(12.2)`. This technique has already been used extensively throuhout the course when calling the `Scanner.out.println()` statement. 

Take some time to play around with the different values, and practice using some of the functions listed in the documentation. 

```java
import java.lang.math;
public class mathPrac {
  public static void main(String [] args) {
    double randomNum = Math.random();
    double absValue = Math.abs(randomNum);
    // You can combine a few method calls to get the result in one line
    double floorValue = Math.floor(Math.random());
    Scanner.out.println(randomNum);
    Scanner.out.println(absValue);
    Scanner.out.println(floorValue);
  }
}
```



### Floating point math

Java provides a variety of different data types that can hold mathematical values, `short`, `int`, `long`, `float`, `double`, etc. One source of common confusion while performing mathematical operations can originate from the use of the `float` type. The `float` type stores numbers using binary fractions (1/2, 1/4, 1/8, 1/16, 1/32) and the numbers are subject to something called **rounding errors**. Even when storing a float literal the value may change when it is initialized to that value. When performing mathematical operations on floats, over the course of several iterations of reusing the variable, the value contained in the float may differ vastly from the expected or desired result. Always keep in mind that floats are a poor storage option when attempting to work with exact values. 

For a more in-depth analysis on floating point math, check out this article in the Oracle documentation (it is a long read, but dont let all the mathematical jargon intimedate you!). 

<https://stackoverflow.com/questions/1661273/floating-point-arithmetic-not-producing-exact-results/>



