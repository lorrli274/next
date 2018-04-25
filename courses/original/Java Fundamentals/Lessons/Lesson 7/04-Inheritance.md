## Inheritance

Inheritance is one of the four fundamentals of OOP. In Java, inheritance can be implemented in a few different ways. 

## `extends`

The `extends` keyword can be used in Java to subclass. A child class can only extend one parent class

```java
// extends example
// assume that Activity is a class
public class MyActivity extends Activity {
    public static void main(String[] args) {
        // do something
    }
}
```

## `implements`

Mulitple inheritance can be accomplished by using `interface`s and the keyword `implement` followed by the subsequent list of `interface`s . 

```java
// implement
// assume that Activity is an interface
public class MyActivity implments Activity, UserInterface {
    public static void main(String[] args) {
        // do something
    }
}
```

A class can also `extend` one super class and `implement` multiple interfaces:

```java
// extending and implementing
public class MyActivity extends Activity implements UserInterface {
    public static void main(String[] args) {
        // do something
    }
}
```



## Composition

Composition is not inheritance but it is used as an alternative to counter the need to feel as if inheritance is the only option. It is common once being taught the skills required to inherit and subclass that inheritance becomes overused as the defacto go to for new programmers. It is not usually the case and often programmers prefer something called **composition**. Composition is simply instantiating an instance of an object instead of inheriting from it. An issue that can plague programs is when unrelated classes begin to inherit from parent classes, instead of using instantiated an instance of that particular classes. A good question to ask is: "is there a relationship?". If the answer is "yes", the subclass should inherit. If the answer is "no", the class should compose a new instance of the class. 