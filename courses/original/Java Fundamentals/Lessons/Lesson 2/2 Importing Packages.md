## Activity 3: Document Structure 

## Importing Packages

A package is a collection of related classes and code that you can import into your project. Packages can contain code and classes that you might find useful in your own program, without the need to write those classes and methods yourself. Standard libraries that are included with Java JRE and JDK distributions are called the **Java Class Library**. These include packages such as `java.lang` and `java.math` packages. 

There are an enourmous amount of third party packages available in online repositories such as GitHub, that can offer more unique and tailored libraries to more specific needs. Throuought the software development lifecycle it is always a good idea to research these libraries as they can save hours and even days of internal software development. 

```java
import java.lang
import java.math
import java.io
import com.github.library.*
```



> One of the most important aspects of programming is staying organized. Keeping your project files organized, and your code organized can all help improve code readability, reusability, and cut time in development.

## Creating Packages

When programming it is common to organize code into packages. This can be done but adding a package header at the state of each file, the package header is the first line of code in a file excluding comments. 

```java
// Program demonstrates creating package for this file
package mypackage;
import java.util.*;
public class Foo {
    private static void main(String[] args) {
        System.out.print("This class is now part of the `mypackage` package");
    }
}
```

When naming a package to avoid interference with other programmers all over the world who might be making similar packages, it is common to use a reverse domain in all lowercase as standard naming conventions, `com.codevolve.mypackage`. This is called the **fully qualified name** and it will ensure that unless another package is named `com.codevolve.mypackage` a conflict will be avoided. 

The above snippet should look like this: 

```Java
// Program demonstrates creating package for this file
package com.codevolve.mypackage;
import java.util.*;
public class Foo {
    private static void main(String[] args) {
        System.out.print("This class is now part of the `com.codevolve.mypackage` package");
    }
}
```

Now when we include the package `com.codevolve.mypackage` in our code we get the class `Foo`. If `com.codevolve.com` consisted of hundreds of flles and classes, we can narrow our import using the fully qualified name of the file that needs to be imported. `com.codevolve.mypackage.Foo`. 