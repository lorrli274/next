## `null` 

The `null` character is a way to assign the value of "unknown" or " no object" (slightly different from "nothing") to a variable. It indicates to the compiler that a reference has been assigned but that space in memory does not contain anything. `null` is not an instance of any class and `null` references can be used to instantiate variables that will not have an immediate value or their value at runtime is unknown. Special checks must be taken into account when accessing variables that might be `null` as attempting to access them can cause errors and / or a program to crash. 

```java
Integer age = null;
// do something
age = 12;
```

```java
if(age != null) {
    // do something
}
```

`null` variables are often set where variables of unknown value must be declared but should not be carrying a value during runtime. These can be included in classes prior to instantiation, or local variables before use. It is very common to receive `NullPointerException` when accessing variables that have been set to `null` and are being accessed. This exception will indicate that a check like the one show above needs to be implemented before accessing a potentially `null` variable. 



