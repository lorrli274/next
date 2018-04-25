## Recursion

**Recursion** is a conept in computer programming, not just in Java, where a function is designed to call itself *N* number of times to perform a desired block of code, until a **base case** evaluates to `true`. Recursion can be a bit confusing, but it is an important concept to understand and its important to know how to implement it effectively and efficiently. 

The basic idea behind recursion is that a function can implement an operation on a data set that gets it *N-1* steps closer to the base case. Instead of manually calling the function *N* times, or throwing the function in a loop, the function can perform the operation on the data set and proceed to make another call to itself on the dataset. 

```Java
private long factorial(int num) {
    if (num == 1) {
        return 1
    }
    return num * factorial(num - 1);
}
```

Above is an example of a recursive function computes the factorial of `num`. If the `num` is equal to `1`, the recursive function returns `1` as that is the last logical case in a factorial operation. If `num` does not equal `1`, it will perform the operation of `num * num - 1!` (the `!` being the factorial of `n - 1`). In the above snippet, `if (num == 1) {}` is the base case. Once this evaluates to `true`, the recursive function begins to return and no longer calls itself recursively. 

Let's use **5!** as our factorial example. 

```java
5 * factorial(4); // 5 * 24 = 120
	4 * factorial(3); // 4 * 6 = 24
		3 * factorial(2); // 3 * 2 = 6
			2 * factorial(1); // 2 * 1 = 2
```

In the above example you can see that the same operation is performed over and over, in this case 5 times. Once the recursive function is equal to 1, the recursive functions starts its chain of return statements back to the original calling point. 

Recursion depends on the idea that a base case condition can be met for the recursion to break. Otherwise it will run endlessly, like a <u>infinite loop</u>. In the factorial example above, that base case condition is  `n == 1`. 

## Towers of Hanoi

Below is a common example of recursive problem. The **Towers of Hanoi** is a problem commonly used when demonstrating and testing recursion. The goal of the towers of hanoi is to move circular disks of descending sizes from a board with three pegs, from the first peg to the third peg. The rules are that a larger disk cannot be placed on top of a smaller disk.

```Java
// Start
 	|			|			|
    1			|			|
   222			|			|
  33333			|			|
 4444444		|			|
555555555 	 _______	 _______
```

***Figure 1***

```java
// End 	
	|			|			|
    |			|			1
   	|			|		   222
  	|			|		  33333
 	|			|		 4444444
 _______ 	 _______	555555555
```

***Figure 2***

The snippet below contains the one recursive solution to solving the Towers of Hanoi. Run the code, and observe the output. Try removing the code alltogether and attempting another solution from scratch. There is more than one way to complete this problem. 

```java
// Towers of Hanoi
class HanoiTowers {
    public static void main(String[] args) {
        // Move 5 disks from tower 1 to tower 3
        moveDisk(5, 1, 3);
    }
    
    private static void moveDisk(int disk, int startPeg, int endPeg) {
        // This is the base case, when disk == 0, there are no more disks to move
        if (disk == 0) {
            return;
        }
        // Get the intermediate peg (this will be the peg that a disk can move to). By using the 6 as a constant (2x the tower limit), we can get the available peg by subtracting starting and ending peg, with a min value of 3 and a max of 5. This line of code can replace the need to implement a control statement
        int interPeg = 6 - startPeg - endPeg;
        // moves disk n - 1 to the intermediate peg
        moveDisk(disk - 1, startPeg, interPeg);
        System.out.println(String.format("Moved disk %d from peg %d to peg %d", disk, startPeg, endPeg));
        // moves disk n -1, once more, this time to the end peg
        moveDisk(disk - 1, interPeg, endPeg);
    }
}
```


