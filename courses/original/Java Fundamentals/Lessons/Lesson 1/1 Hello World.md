## Lesson 1: Basics of Java

### Hello World 

Following a deep rooted tradition, it is common practice for a new programmer to write, or run, there first program under the following conditions: it must be able to say "Hello World!".  Click the green **Run Code** button below to run your first Java program. 

```java
class HelloWorld {
  public static void main(string [] args) {
    System.out.println("Hello World!");
  }
}
```

How easy was that? You just ran your first program. The "Hello World!" application is commonly used to introduce programmers to programming or new languages. You may be thinking, "Whoa! That is a lot of code just to say 'Hello' and I have no idea what all that means". That is alright, I am going to explain it in more detail, line-by-line. It is OK if the some of the terms seem foreign, strange, unknown and it will make more sense as your knowledge of the Java programming language continues to advance throughout this course. 

Let us start out with first line of code: `class HelloWorld { ` - `class` is a keyword that lets the compiler know that you are defining a class, it is followed by the name of the class `HelloWorld` (notice how it is written **CamelCase**) and the start of its **scope** using an opening curly bracket, `{`. 

On line two we see a few more keywords, and possibly some confusion. 

* `public` - is a keyword used to make the main function accessible. If you recall from the previous chapter, ***Chapter 1: Basics of OOP*** `public` is a keyword used to enforce access controls as mentioned in the *Encapsulation* section of that chapter. 
* `static` - is a another keyword similar to `public` but this keyword deals with memory management, and tells the compiler to allocate memory to this method only once. Other instances of the `class HelloWorld` will use the `main` already allocated in memory. 
* `void`  - this keyword tells the compiler that this method or function does not return a value, so as not to expect one. 
* `main(string [] args) {` - `main` is the name of the method, inside the `()` are what we call **arguments**, or **parameters**. These arguments are an `array` of the type `string`  and are used to read command line input. This is followed by the opening of another scope, relative to the `main`. 

Within the scope of the `main`on line 3, we have the `System` object followed by its member `out` followed by its function `println();`

 Java statements end in `;`. Think of this `;` as a period to end a sentence. The reason they were not added in line 1 and 2 is because those statements open and close scopes, or **blocks** of code, they start and end with `{}`. Adding a `;` to the end of every Java statement may be confusing at first, but it is something that you will pick up quickly without thinking about it.  

Line four and five close out the scopes, or blocks, of the `HelloWorld` class and `main` method respectively. 

Whew! Not that may have been a little dense, but do not fret friend. Although this page is labeled "Basics of Java" most of what we covered is a little more advanced and will be covered in more detail in later chapters. 
