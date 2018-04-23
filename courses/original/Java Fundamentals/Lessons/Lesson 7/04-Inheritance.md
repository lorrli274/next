## Inheritance

Inheritance is one of the four fundamentals of OOP. In Java, inheritance can happen a few different ways. 

##  `extends` 

The `extends` keyword can be used in Java to subclass. 

```java
// extends
```

## `implements`

Mulitple inheritance can be accomplished by using `interface`s and the keyword `implement` followed by the subsequent list of `interface`s . 

```java
// implement
```

## Composition

Composition is not inheritance but it is used instead to counter the need to feel as if inheritance is the only option. It is common once being taught the skills required to inherit and subclass that inheritance becomes overused as the defacto go to for programmers. It is not usually the case and often programmers prefer something called **composition**. Composition is simply instantiating an instance of an object instead of inheriting from it. An issue that can plague programs is when unrelated classes begin to inherit from their parent classes, instead of using instances of those classes. A good question to ask is: "is there a relationship?". If the answer is yes, the subclass should inherit. If the answer is no, the class should compose a new instance of the class. 