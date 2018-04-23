## Quiz #2

1. In Java, the `i++` and `++i` are the same: True of False?

   Answer: False, the post-increment and pre-increment operator may return the same value, but pre-increment operator will return the value after it has been incremented while the post operator will return the value before it has been incremented. 

2. In Java, the `=` operator will return true if the value of the right and left operands are equal. 

   Answer: False, the `=` is the assignment operator. The `==` operator will return true of the operands are referring to the same objects in memory and the `.equals()` method will return true of the values of the operands are equal in value. 

3. What is the answer to the following problem: 

   ```Java
   int value1 = 40;
   double value2 = 20;
   int answer = 20 + 40;
   ```

   a. 60.00 of type `double`

   b. 60 of type `int`

   c. 60 of type `byte`

   d. None - this operation is not legal. 

   Answer: d, primitve types cannot be added together without them being cast. 

4. It is recommended that `(..)` parenthesis be avoided becuase they can make code hard to read and can be confused with `{..}` which representsa code block's scope: True or False?

   Answer: False, `(..)` should be used to help clarify operational complexity by explictily declaring the order of operations that a formula should follow. 

5. What library should programmers `import` into their program to get access to a variety of mathematical classes and methods, that can save time in development and enable more complex mathematical algorithms? 

   a. `java.lang.math*`

   b. `java.util.*`

   c.  `java.math.*`

   d. `java.calculator.*`

   Answer: a