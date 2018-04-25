## Interface

An `interface` is a contract between the parent class and the implementation class. An `interface` declares methods that must appear in the calling class's code for the program to work. This "contract" enforces that certain methods are implemented in the calling class. `interface`s are not instantiated, and all their fields are `public`, `static`, and `final`. This contrasts to a Java abstract class where all the fields are more flexible and can be non-static, non-final, `public`, `protected`, and `private`. 

The below snippet shows the syntax used to create an `interface`:

```java
interface Train {
    void numberOfCars(int carCount);
    void numberOfConductors(int conCount);
    void engineSize(int pistonCount);
    void throttleSpeed(int speed);
}
```

```java
class Bombardier implments Train {
 	int size, conductors, engineSize, maxSpeed;
    void numberOfCars(int carCount) {
        size = carCount;
        // do something else
    }
    public void numberOfConductors(int conCount) {
        conductors = conCount;
        // do something else
    }
    public void engineSize(int pistonCount) {
        pistons = pistonCount;
    }
    public void thorttleSpeed(int speed) {
        maxSpeed = speed;
    }
    
}
```

Above we have an `interface` and the class `Bombardier` that `implements` `Train`. The `implements` keyword creates the "contract" between `Bombardier` and `Train` to ensure that the methods in `Train` appear in `Bombardier`. If the required methods are missing, the compiler will throw a warning, or the program will crash.

There is one instance where a class does not need to implement *all* the methods of an interface, and that is when the class is declared to be <u>abstract</u>. In the this instance a parent class can implement `Train`, implementing three of the four methods, before its child class implements the remaining method. 

```java
abstract class Diesel implments Train {
    void numberOfCars(int carCount) {
        size = carCount;
        // do something else
    }
    public void numberOfConductors(int conCount) {
        conductors = conCount;
        // do something else
    }
    public void engineSize(int pistonCount) {
        pistons = pistonCount;
    }
}
```

```java
class GeneralElectric extends Diesel {
     public void thorttleSpeed(int speed) {
        maxSpeed = speed;
    }
}
```



## When should you use an `interface`?

Why use an `interface` instead of a <u>class</u>, or an <u>abstract class</u>? An `interface` allows for a few advantages. The first, is that Java does not support multiple inheritance. This means that `Bombardier` can not inherit from class `Vehicle` and class `Train`. It can inherit from the `Vehicle` class and `implement` the `Train` interface. `interface`s  tell a class what it HAS to do and not HOW to do it. 

An `interface` should be used when you want to a object to use multiple inheritance, expect unrelated classes to make use of the contents of an `interface`, or want to specify behavior of a type without regard to what implements that behavior. 