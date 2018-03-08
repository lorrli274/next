## `for` loop

The `for` loop provides a easy syntax for iterating over ranges.  The `for` loop will continue to iterate until a provided condition is met. 

```java
for (/*initialization*/; /*condition*/; /*increment*/) {
    // code
}
```

```java
//Method 1
for (int i = 0; i < 5; i++) {
    y += x;
}
```

The basic `for` declaration consists of 3 arguments : **initialization**, **condition**, **increment**. Initialization is the initializing of the variable to be used to evaluate the condition and the variable that receives the increment. In the above example it is `i` , a common variable used in `for` loops. The condition is that as long as `i < 5`, the body of the `for` loop will add the value of `x` to `y`. Each time `y += x;` is run, the value of `x` is increased by 1, `x++`. 

`for` loops can be used to iterate over arrays, collections and sets. 

```java
//Method 2
for (int number : arrayOfNumbers) {
    System.out.println(number);
}
```

Using this format is much preferred when working with arrays, collections, and sets. When using the first method special attention must be paid to the condition argument to ensure that the loop does not access an index that exceeds the bounds of the array, <u>IndexOutOfBoundsException</u>. 

Loops can also be used to populate data into arrays, collections and sets

```Java
int[] myArray = [100];
for (int i = 0; i < 100; i++) {
    myArray[i] = i;
}
```

`for` loops are useful when needing to perform a repetitive task on a data set. However, `for` loops, especially when nested, can become very inefficient and there may be better ways of performing a desired task. `for` loops are also succeptible to becoming an  <u>infinite loop</u> if the increment and the condition are not set carefully. 

Below is a snippet that contains three `for` loops. Look over the snippet and review the code. Alternate between running the snippet and altering the code to observer the change in output. 

```java
// Demonstration in for loops
import java.util.Scanner;
class MyForLoops {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        String[] myArray = new String[5];
        // prompt the user for 5 Strings 
        System.out.println("Please enter 5 Strings: ");
        for (int i = 0; i < 5; i++) {
            myArray[i] = input.next();
        }
        //iterate over the array and print the strings to the console
        for (String s : myArray) {
            System.out.println(s);
        }
        //iterate over the array in reverse and print the strings to the console
        for (int i = myArray.length - 1; i >= 0; i--) {
            System.out.println(myArray[i]);
        }
    }
}
```







