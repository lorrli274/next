## Infinte loop

A common logic error can occur with loops that are not terminated properly called the **infinite loop**. The infinite loop will run continuous (forever), until the program crashes, runs out of resources, or is forced into a hard stop / shutdown manually. An infinite loop can occur when the expression to be evaluated never evaluates to true. 

```java
int x = 2;
while (x != 1) {
    ++x;
}
```

The code above will never evaluate to true since the `x` is already greater than `1`. `++x` will run until the program crashes, or it is forced to shut down. 

## 