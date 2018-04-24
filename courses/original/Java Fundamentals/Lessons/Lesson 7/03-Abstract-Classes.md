## Abstract Classes

An `abstract class` is a class that cannot be instantiated, and contain a mix of methods with or without implementations. An `abstract class` can be subclassed, but classes in Java can only inherit from class at a time. `abstract classes` differ from `interfaces` in that they are usually written for a use within a group of very closely realted objects that share fields and methods. 

Below is the syntax to declare an `abstract class` : 

```java
public abstract class Life {
    private boolean hasSoul;
    abstract void breathing();
    abstract void think();
    void setDefaults(boolean soulStatus) {
        hasSoul = soulStatus;
    }
    
    public boolean getSoul() {
        return hasSoul()
    }
    public boolean setSoul(boolean soulStatus) {
        hasSoul = soulStatus;
    }
}
```

## `abstract class` v. `class`

What is the difference between an `abstract class` and a `class`? A normal class is used as a template to represent a real world object. This is something that can be instantiated and used, but might also be used as the template for another object. Let's say that we have an object `Animal`, you can have an animal, animals are real, you can also have a `Dog` which is type animal and shares some of the same traits as other animals. `Life` on the other hand isnt "real". You cannot find life, you cant touch life, but life has certain characteristics, such as breathing, circulation, consciousness, etc.  You cannot create life, or touch life, but life is something that an animal has and thus a dog has. When something has life, it HAS to have certain characteristics that make it alive, otherwise it is not alive. This is where an abstract class comes in. `Animal` and `Dog` are classes and `Life` is an `abstract class`. 

## `abstract class` v. `interface`

`abstract classes` and `interface`s are very similar, The first major difference is that extending an `abstract class` is limited to one, while implementing an `interface` is not. A programmer should chose to use an `abstract class` when closely realted classes should be sharing code, subclasses have many similar classes, when access modifiers are required (private, protected), and when using non-static and non-final properties. 
