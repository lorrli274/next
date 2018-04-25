## Quiz #4

1. Which control flow expressions "falls through"?

   a. `if`

   b. `for` loop

   c. `switch` statement

   d. `if / else - if`

   Answer: c

2. All the control flow statements in this chapter are suseptible to becoming an infinite loop: True or False?

   Answer: False, `if / else - if` and `swtich` statements have default expressions used to ensure at least one block is executed. 

3. The "pyramid" discussed in this chapter is a programming technique used to..

   a. ..write confusing code and should be avoided.

   b. ..implment all control flow statements in a giant expressions to handle any possible scenario.

   c. ..the basic structure of a `if / else - if` statement

   d. ..build foundational code upon which other programs and programmers can build and expand on. 

   Answer: a

4. Which of the following code blocks contains the best implementation for a `switch` statement:

   a. 

   ```java
   Integer x = 10;
   switch(x) {
       case 1:
           stop;
       case 2:
           stop;
       case 3:
           stop;
       else {
               // do something
           }
   }
   ```

   b. 

   ```java
   Integer x = 2;
   switch(x) {
       case 1: 
           // do something
           break;
       case 2:
           // do something
           break;
       case 3:
           // do something
           break;
       default:
           // do something
               
   }
   ```

   ​

   c. 

   ```java
   Integer x = 2;
   switch(x) {
       case 1:
           if (x = 2) {
               // do something
           }
       case 3: 
           if (x = 2) {
               // do something
           }
       default:
           if (x = 2) {
               // do something
           }
   }
   ```

   d.

   ```java
   Integer x = 2;
   switch(2) {
       case x: 
           // do something
           break;
       case x:
           // do something
           break;
       case x:
           // do something
           break;
       default:
           // do something
               
   }
   ```

   Answer: b

