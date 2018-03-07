## `if`

The `if` statement is a very common conidition statement which runs an boolean evaluation on a statment. "If this is true, do this". 

```java
if (/*expression == true*/) {
    // Some code
}
//..continue
```

In the above block, the if statement evaluates `a > b`, if this statement is true, the code inside the `if` block will run before moving on to the rest of the program. If the statement is `false`, the `if` block is skipped. 

## `if / else`

If an `if` statement evaluates to `false`, and we would rather it run another segment of code before continuing, an `else` statement is used. 

```java
if (/*expression == true*/) {
    // Some code
} else {
    // Some code
}
```

## `if / else-if`

When wanting to evaluate a statement in more than two ways, an `else-if` statement can be implemented. 

```java
// if / else / else - if
/*
	Demonstrates the different forms of the if conditional statements
*/
public class ifDemo {
    int myInt = 2;
    String myMsg = "";
    
    public static void main(String[] args) {
        if (myInt == 0) {
			myMsg = "myInt = 0";
        } else if (myInt == 1) {
 		    myMsg = "myInt = 1";
		} else if (myInt == 2) {
 		    myMsg = "myInt = 2";
		} else {
  		    myMsg = "myInt = ?";
		}
        
        System.out.println(myMsg);
    }
}
```



## Pyramids

A danger with the simplicity of implementing `if` statements is something called **Pyramids**. Because of their simplicity, it can be easy to over implement `if` statements and nest several `if` statements within each other. 

```java
if (/*condition*/) {
    if (/*condition*/) {
        if (/*condition*/) {
            // ...
        } else {
            if (/*condition*/)
        }
    } else {
        
    }
} else if (/*condition*/){
    
} else {
    
}
```

The above structure starts to mimic a pyramid. In the early stages of programming this may seem to be an easy solution to implement while working through your code as you write it. In practice, this is a poor solution to implement. The implementation above can be confusing to read, debug, follow, and the blocks contain no code, so it is capable of getting even more complex. Whenever developers come across pyramids, whether writing them, or reading them, it is always a good idea to look for a way to better optimize the code. This could include potential parameters through optimizing functions, using different control flow options, and **recursion**. 