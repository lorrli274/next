## Arrays

An **array** in Java is a container object that contains a preset number of **elements** of one type. An array's length is fixed, but the values inside the array are mutable. 

```java
int[] myIntArray = {
    0,1,2,3
} // Option 1
int[] myDoubleArray = new double[10]; // Option 2
```

The above code block demonstrates the syntax for declaring and initializing arrays with two options. The `[]` after the type declaration tells the compiler that the variable is going to be an array. Option 1 declares and initializes an array of 4 `int`s which contain 4 elements, while option 2 declares and initializes an array of size 10, but contains no elements. 

Setting and getting elements of an array requires the following format: 

```java
myDoubleArray[0] = 1.2;
myDoubleArray[4] = 5.9;
double myDouble = myDoubleArray[0];
```

One important caveat to note is that array elements begin their indices at `0`. An array of 10 objects contains elemtents `0` through `9`. Attempting to access an element at `[10]` will throw an exception. A simple mistake in fetching an array element may lead to uneccesary time spent debugging.  

## Multidimensional Arrays

**Multidimensional arrays** are arrays of arrays. 

```java
// Multidimensional array 
/*
	Demonstration of using a multidimensional array 
*/
public class MultiDArray {
    public static void main(String[] args) {
        String[][] roster = {
            {"John", "Rob", "Sarah", "Beth"},
            {"13", "14"}
        };
        System.out.println(roster[0][1] + " age " + roster[1][0]);
        System.out.println(roster[0][2] + " age " + roster[1][1]);
    }
}
```

Pay careful attention to the syntax used to declare and inialized values for the multidimensional array. Getting and settting a 2D array will consist of using two sets of `[]` to get the "row" and the "column" of the element. 