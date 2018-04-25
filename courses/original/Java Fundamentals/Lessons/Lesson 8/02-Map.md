## Map

A `Map` is a collection that creates a key-value pair for storage. Some characteristics of `Maps` are:

* Keys must be unique, it is possible to use mutable objects as keys but this is not advised. 
* Each key is paired with one value. Values themselves can be objects that contain muliple sub values. 
* Elements are not indexed and not accessible via an index. 

 There are three main implementations of the `Map` interface: `HashMap`, `LinkedHashMap`, `TreeMap`. This snippet will focus on the `HashMap` implementation. Other implementations are covered in the <u>Java Core Concepts</u> course.

```java
// Map demo
import java.util.Collections;
class myMapDemo {
    public static void main(String[] args){
        HashMap<String, String> ml = new HashMap<String, String>();
        // add new key-value pairs
        ml.put("theme", "dark");
        ml.put("language", "Java");
        ml.put("collection", "Maps");
        // remove a pair
        ml.remove("collection");
        // get size of the Map
        System.out.println(ml.size());
        // check that values and keys are in the Map
        System.out.println(ml.containsValue("Java"));
        System.out.println(ml.containsKey("collection"));
    }
}
```

info> Be sure to look at the offical Java Documentation to get a complete list of all the methods available. 

The snippet above covers the implementation of a new `HashMap` and five commonly used methods. The implementation format may look strange at this point, but the syntax, `<>` , contains the data type for the `<key, value>` pairs that will be used for the `HashMap`. Below is the list of the of the methods and the function they perform on the `HashMap`:

1. `.put` - inserts and key-value pair
2. `.remove` - removes the specified key-value pair
3. `.size` - returns the number of key-value pairs
4. `.containsValue` - returns true if the specified value is mapped
5. `.containsKey` - returns true if the specified key is mapped