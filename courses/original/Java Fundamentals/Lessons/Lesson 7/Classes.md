## Classes

A class in Java in the means by which developers can encapsulate the characteristics of real world objects into a template that will be used in code. A great example of this encapsulation process is creating a class modeled on a vehicle. What is a vehicle? There a number of different ways to describle a vehicle, a car, a plane, a boat, a bike. Developers take the characteristics of a vehicle and model it in code for use throughout the program. 

```java
class Vehicle {
    // attributes
    private String type;
    private int serialNo;
    private int passengerCap, fuelCap, cargoCap;
    private int currentPass, currentFuel, currentCargo;
    private String color;
    
    // constructor
    public Vehicle() {
        
    }
    
    // get and set methods
    public setType(String t) {
        this.type = t;
    }
    public String getType() {
        return this.type;
    }
    
    public setSerialNo(int num) {
        this.serialNo = num;
    }
    public int getSerialNo() {
        return this.serialNo;
    }
    public setCurrentPass() {
        this.currentPass++;
        this.currentCargo++;
    }
    public int getCurrentPass() {
        return this.currentPass;
    }
    
    /*
    {
    ...
    ...
    }
    */
    
    // functions
    /** prints out a description of the current vehicle */
    public void display() {
        
    }
    /** returns the remaining fuel */
    public static int remainingFuel() {
        
    }
    
    /** returns the remaining passenger capacity */ 
    public static int availableSeating() {
        
    }
    
    //** returns the available cargo spaces */
    public static int availableCargo() {
        
    }
}
```

In the above code snippet, the class `Vehicle` has member fields that store specific values realted to each vehicle. An explicit **constructor** which is used to instantiate new objects and set defaults for the attributes and provide the object with default values. When a new object is instantiated, the constructor for that object is called. 

## Get and Set methods

To access the class fields, objects employ the use of **get** and **set** methods. This allows safe access to the fields from another class. Using get and set methods allow a class to check that the input for each variable is valid and safe, <u>throw and catch</u>, refuse to accept the input, and allows subsequent action to take place. In the above snippet, each person in the vehicle also takes one cargo spot in the vehicle. So each time a person is added to the vehicle using the `setCurrentPass()` method, both the current passenger count and the current cargo count are incremented. This may not be the case if we were updating just the `currentCargo` variable as one cargo spot does mean that one passenger spot is taken as a passenger can use more than one cargo spot. 

## Functions

Classes may also contain their own `private` and `public` functions. Remember, `private` functions are only avaliable when access from within the same class. When creating classes it is common that fucntions are `static`. Declaring functions as `static` means that all instances of the `Vehicle` class will reference the same function in memeory instead of creating a new reference when instantiated. In other words, if three `Vechicle` objects are delcare and each make a call to `availableFuel()`, each class calls the same function in memory. However, each class creates their own `display()` method, since it is not declared `static` and call the reference where that method is stored. Using the `static` keyword helps cut back on memory inefficiency. 

```java
class myClassTest {
    public static void main(String[] args) {
        Vehicle v1 = new Vehicle();
        // set and get examples
        // display() example
    }
}
```

