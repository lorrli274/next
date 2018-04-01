## Objects

Objects in programming is the means by which a developers models real world objects into programming languages. Objects form the basis of *Object-Oritented Programming*. When creating programs, developers will often spend the early stages creating lists of objects that a program will need to model. For example, a program will not know what a vehicle is until a programming gives the program an explicit model for what a vehicle is, what it is made of, its size, purpose, name, type, etc. 

## Classes 

Classes are a fundamental part of object oriented programming. They embody some the versatility that has made the OOP paradigm so successful and wildly taught paradigm. Classes act as blueprints from where objects can be instantiated (an object is an instance of class) from the template and used with slight variations througout a program. 

## Encapsulation

Encapsulation is the process of enclosing related data and methods into a class and restricting access to those methods to only instances of the object. A common example is a class used to represent a  `Vehicle` which can be used to instantiate car objects, bike objects, and truck objects by intializing a new `Vehicle` object and providing it with the appropriate attributes, such as `String type = "car"`. Each object has access to the methods that are encapsulated within the `Vehicle` class, but the unrelated object of class `Plant` does not have access to attributes or methods within the `Vehicle` class. 

## Inheritance

Inheritance is the concept and practice of using class blueprints to create other classes. When a class inherits from a **parent** class, it is called a **child** class. When a child class inherits from a parent class, it can receive some of the traits and data (attributes and methods) of the parent class. If we again take the `Vehicle` class and created two subclasses, `Car` and `Plane`, the child objects can inherit data and methods from the parent class that help calculate fool, lock the doors, track passengers, but only the `Car` object might have attributes and methods to calculate mileage `totalMileage`, whereas a `Plane` obejct will track hours instead, `totalHours`. In this case each child class inherits methods from the parent class but adds certain methods that pertain to only objects of that class. The parent class does not have access to those methods.

This chapter will cover: 

2. Classes
2. Inheritence
3. Interfaces
4. Abstract Classes

