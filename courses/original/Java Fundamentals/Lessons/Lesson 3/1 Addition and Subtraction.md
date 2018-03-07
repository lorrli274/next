## Activity 4: Arithmetic Operations

### Addition and Subtraction

Simple addition in Java follows the same rules and structure that you would use to perform addition on paper. 

```
answer = value1 + value2
```

In the example above we have 3 variables (*Note: `value1` and `value2` are not in all caps or SCREAMING_SNAKE_CASE, this would indicate that they are variables*) and two operators. 

When using the `+` operator, it is important that both values on the right and left (in the example above, `value1` and `value2`) are of the same type. You cannot add a `float` and a `double`, you can only add a `double` and a `double`, or a `float` and a `float`.  

```java
public class Addition {
    public static void main(String[] args) {
        
        int answer = 0;
        int value1 = 5;
        int value2 = 3;
        int value3 = 9;

        answer = value1 + value2;
        Scanner.out.print(answer);
        answer = value1 + value2 + value3;
        Scanner.out.print(answer);
        answer = 10 + value2;
        Scanner.out.print(answer);
    }
}
```

Play around with the snippet above. Change the values and the order of the variables and observer their output in the terminal. 

### Subtraction

Subtraction is similar to addition, following the same rules but using the `-` operator. Like in addition, you can add and subtract multiple values in the same line of code. Once a value is assigned to a variable, you can reuse that variable in the equation. 

```java
public class Subtraction {
  public static void main(String[] args) {
    int value1 = 4;
	int value2 = 8;
    int answer = value2 - value1; // answer = 4
	answer = answer + value2; // answer = 12  
    answer = 12 - 5; // answer = 7
  }
}
```

In the above snippet, you can see that the variable `answer` is initialized to the difference of `value2` - `value1`. In the next line of code `answer` assigned the value of `answer` + `value2`. 

You may have also noticed in both this section and the previous section, *Addition*, that some lines of code and their equation contain plain digits and not variable names. These are called **literals** and they represent a value exactly as it is written. Literals can be easy to read, so why don't we use literals all the time?

Well, imagine that you type out the literal `12` six times in your code, and then later decide that you need to use number 13 instead. Instead of changing each instance, you can change it once at the source, the variable value. This is much faster and ensures that you do not miss any stranded literal values that may be buried in code. 

### Some Semantics

It is also important to note that primitive data types are representations of allocated memory which have minimum and maximum values according to the size of memory they can reserve (`short` is 16-bit, `int` is 32-bit, `long` is 64-bit). 

Below is a table that shows the maximum value for some of the primitive data types in Java:

| Data Type | Min. Value     | Max Value     |
| --------- | -------------- | ------------- |
| byte      | -128           | 127           |
| short     | -32,768        | 32,767        |
| int       | -2,147,483,648 | 2,147,483,647 |
| long      | -2^63          | (2^63) - 1    |

If the total value is to exceed the limit that can be stored in the data type, you may need to cast to the appropriate type or create your own object to store the value. 

There are some variables and constants provided in code. Change their values and data types and run the code to see the output that they produce. 

