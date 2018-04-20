## Chapter 1: Java

The Java programming language was developed by a company called Sun Microsystems in the 90's as a multiplatform programming language. Sun Microsystems was bought by Oracle and Oracle now owns and maintains the language and its documentation. Java derives a lot of its core concepts from C++ and C so if you have any experience with those languages Java may seem familiar to you.  

### Brief History of Java

Over 20 years ago, Java was a language that was designed to be cross platform, meaning that its creator (James Gosling) and intended that one code base of Java could be run on multiple different platforms without the developer needing to write the same program in multiple languages for different ecosystems. This would be accomplished by using the **Java Virtual Machine** or **JVM**.  Since 2010, Java has been owned and maintained by Oracle. 

### Object Oriented Programming

Why do you need to know about OOP? The four pillars of OOP are what make up the most popular programing languages (although not all, Functional Programming Languages make up another programming paradigm) and the core concepts of Java are intertwined with this paradigm. Understanding each pillar will help make sense of future concepts that we are going to cover, give you a better understanding of the structure of the Java language, and help clear up and simplify writing clean code. The four pillars are **Encapsulation**, **Inheritance**, **Abstraction**, **Polymorphism**. 

### Encapsulation

Encapsulation is the concept that keeps data and methods that manipulate that data enclosed within an object. Encapsulation can be thought of as taking an object and encapsulating it within a class. Let's say that you look out your window and see a car. You can encapsulate this car  into the `class` `Vehicle` , which can be instantiated at various points in your program's runtime. This helps classes enforce access restrictions to an object's data and methods within a program.  Encapsulation can hide data and methods from other areas of the program, this is done using the `private` and `public` keywords, which you will learn about later. Encapsulation also helps code reuse, code readability, and organized and clean code. 

### Inheritance

Inheritance allows objects to be arranged hierarchically. One class may inherit methods from a **Parent Class**. This helps keep code lean and organized, allowing developers to write methods once that can be used across multiple objects. In the previous example we had `Vehicle` object but what type of vehicle? Maybe it is a car? Or a bicycle? We can encapsulate either into a new `class` that inherit attributes from `Vehicle` so that we do not need to rewrite similar data and methods. Inheritance is extremely powerful when implemented efficiently, but its the inefficient use of inheritance that needs to be watched closely. Java allows only single inheritance (only one parent class), in other languages that offer support for multiple inheritance it is possible to over inherit objects, where better options are to instantiate new instances of those objects instead. We will touch more on this concept in ***Chapter 7: Classes***. 

### Abstraction

Abstraction is the process of "hiding complexity". This helps improve readability and removes some of the underlying complexity that may not be pertinent in certain contexts. Abstraction helps simplify code, keeping it organized, and helps avoid duplication. Let us think about Abstraction in a different way. You have a calculator and enter numbers to satisfy a formula to get an answer. The calculator has certain levels of abstraction. The first is as you enter the numbers, you do not know how the calculator handles the inputs after you press each button, nor do you really care, it is complicated and you just want the end result. The calculator likewise, does not know what or who is pushing the buttons or what algorithm you are following, nor does it care, it just wants to compute. Each is focused on performing its own specific task, but dependent on the other top deliver the desired result. This concept is explored in ***Chapter 6: Methods and Functions***. 

### Polymorphism

Polymorphism allows methods to be applied on different sets of data during different points in a program. Using our previous example, lets say that we write a method `foo()`that takes a `Vehicle` object as a parameter. We have two subclasses, `Car` and `Bicylce` that both inherit from `Vehicle` so we can pass either `Car` or `Bicycle`  to `foo()`.   Polymorphism also allows programmers to `override` methods of parent classes to conform to specific conditions in a program that may not have been available the original method. If a `Vehicle` has a method called `bar()` that prints the number of doors a vehicle has, we may want it to print something different for the `Bicycle` class. 

### Summary

Well done. Covering the basics of OOP can be confusing and a little dry, but they are essential to improving programming skills and the quality of code that you can write. It helps when working collaboratively on projects and when onboarding new engineers keeping code clean, straight forward, readable. These concepts will present throughout this course and your other programming ventures. 

Alright,  lets get started with some programming. 