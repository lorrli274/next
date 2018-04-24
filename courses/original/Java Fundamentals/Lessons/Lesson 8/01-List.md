## List

A `List` is a collection interface in Java that allows for the storing of unordered, index, elements, in a mutable object. Some of the characteristics of `List`s are: 

*  `List`s do not need to have their size declared at runtime
* Elements can be added, removed, shifted without manually restructuring the `List``

There are different implementations of the `List` interface: `ArrayList`, `LinkedList`, `Vector`,  and `Stack` classes. This snippet will focus on the `ArrayList` class. Other implementations are covered in the <u>Java Core Concepts</u> course. 

The `ArrayList` is an implemenation of the `List` interface that keeps the insertion order of elements, allows for `null` characters. 

```java
// List demo
import java.util.Collections;
class myListDemo {
    public static void main(String[] args) {
        // note that an initial size is not provided
        List al = new ArrayList();
        al.add(0, "Mike");
        al.add(1, "Bob");
        al.add(2, "Sarah");
        al.remove(1);
        String name1 = al.get(0);
        String name2 = al.set(1, "Marjory");
        System.out.println(al);
    }
}
```

Run the snippet above and observe the output. Notice that the code does not manually resize or reassign the `List` to a new `List` object. The `ArrayList` does need to be given a size during initialization and the methods allow for the mutation of the array. `.add` adds a new element at the position specified. `.remove` removes the element at the index provided. `.get` returns the element at the specified index and `.set` returns the specified index value and replaces it with the provided element value. 

Another major advantage to an `ArrayList` is that it is searchable. Below is snippet that contains two `ArrayList`s and performs various operations on the two lists, including and element search. Run the code and observe the output. Update the code with different values and names to get practice using the `ArrayList`. 

```java
// List demo 2
import java.util.Collections;
class myListSearchDemo {
    public static void main(String[] args) {
        List al1 = new ArrayList();
        List al2 = new ArrayList();
        // populate the list
        for(int i = 0; i < 10; i ++) {
            al.add(i, i + 1);
        }
        // combine the two lists
        al2.addAll(0, al1);
        al1.clear();
        System.out.println(al1.isEmpty());
        System.out.println(al1.size());
        System.out.println(al2);
        int index = al2.indexOf(3);
        System.out.println(al2.get(index));
    }
}
```

info> Be sure to look at the offical Java Documentation to get a complete list of all the methods available. 

Because a `List` is mutable and the elements can be added, removed, and shifted, it increases the potential that a program fetching elements with constant index values will receive an `IndexOutOfBoundsExceptions`, or a `null` value, and hard coding indices is not a good practice. 

