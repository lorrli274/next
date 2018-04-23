## Quiz #3

1. Since `char`s make up a `String` object, they share the same methods becuase of inheritance: True or False?

   Answer: False, the relationship between `char`s and `String`s is called composition and not inheritance. Additionally, a `char` is a primitive data type, whereas the `String` is an object. Primitive data types do not have methods so they two cannot share. For a `char` to use methods it must be wrapped in the `Character` wrapper class. 

2. The `+` operator, when used properly, can be used to combine multiple `String` objects: True or False?

   Answer: True

3. The `split()` method covered in section 5 ***String Operations*** is used to..

   a. Split a `String` exactly in half

   b. Removes all the whitespace from a `String`

   c. Returns an array of `String`s using a `char` argument as the divisor

   d. `split()` is a non valid method, and it is actually `substring()`. 

   Answer: c

4. Which of the following statements are correct..

   a. 

   ```java
   System.in();
   ```

   b. 

   ```java
   Scanner input = new Scanner(System.in);
   input.next();
   ```

   c. 

   ```java
   Scanner input = new System.in();
   input.getByte();
   ```

   d. 

   ```java
   Scanner input = new Scanner(System.in);
   input.nextLine();
   input.next();
   input.nextShort();
   ```

   Answer: b and d