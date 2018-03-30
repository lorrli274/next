## Scope

One of the side effects of encapsulation is **scope**. Scope determines where attirbutes and methods in a program can be accessed from. This sometimes correlates to keywords like `public` and `private` which explicitly declare scope, but other instances scope is implicit, like delcaring a variable in a `class`, `for` loop, or method. 

Scope is inherited by sub classes, methods, and blocks. Scope works in a similar manner to inheritence, where attributes can be accessed from a block of code (sub scope) within that scope but the parent scrope cannot access attributes from within the subscope. Scope is usually determined by a set of opening and closing brackets `{}`. 

```java
class MyScope {
    // Scope 1
    int globalVar = 0;
    public static void main(String[] args) {
        // Sub scope 1
        int localVar = 1;
        for (int i = 0; i < 5; i++) {
			// sub scope
        }
    }
    
    private void foo() {
        // Sub scope 2
        int localVar2 = 2;
    }
    
    void bar() {
        // Sub scope 3
        int localVar3 = 3;
    }
}
```

The above block has a `class`, `main` , a `for` loop, and two local methods. Each scope is listed in the comments. `globalVar` can be access anywhere in the file within the `{}` after `MyScope`; however, the three `localVar` variables are only accessible within their corresponding brackets, can cannot be accessed outside. Global variables are accessible outside the class when inherited from, or when delcared explicitly (<u>composition</u>). There are many reasons why variables are not all declared global and why special attention is paid to where and when to declare variables. `globalVar` is a initialized and alive throughout the duration of the program, this means that it is taking up memory to exist, wheras the `localVar2` is delcared, initialized, and forgotten all within the duration of the `foo` function. The program does not remember where or what `localVar2` was once the function has returned. 

## This

Scope allows variables with the same names to exist in the same file without causing or interference. 

```java
class MyScope {
    int i = 0;
    public static void main(String[] args) {
    	foo();
    }
    
    private void foo(int i) {
        System.out.println(i); // Local parameter i
        System.out.println(this.i); // Global variable i
    }
}
```

The `this` keyword is a way to tell the compiler to refere to the object, and not the local context. `this` simply means, `MyScope.i`. The `this` keyword will help programmers interact with variables and methods in different scopes while maintaining clean and readable code. 