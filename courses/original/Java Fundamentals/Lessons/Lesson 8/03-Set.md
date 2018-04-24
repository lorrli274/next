## Set

The `Set` implementation of a `Collection` is: 

* unordered
* contains no duplicates
* ability to perform a unions and differences

There are three variations of the `Set` are `HashSet`, `LinkedSet`, `TreeSet`. This snippet will focus on the `HashSet`. Other implementations are covered in the <u>Java Core Concepts</u> course.

```Java
// Set Demo
class mySetDemo {
    public static void main(String[] args) {
        Set<String> sl1 = new HashSet<String>();
        Set<String> sl2 = new HashSet<String>();
        //sl1
        sl1.add("New Jersey");
        sl1.add("New York");
        sl1.add("Florida");
        sl1.add("Utah");
        sl1.add("Wyoming");
        //sl2
        sl2.add("Oregon");
        sl2.add("California");
        sl2.add("Florida");
        sl2.add("Washington");
        sl2.add("Texas");
        sl2.add("Utah");
       
        System.out.println(sl1);
        System.out.println(sl2);
        sl1.addAll(sl2);
        System.out.println(sl1);
        if (sl1.contains("New York")) {
            System.out.println("This set contains New York");
        }
        // convert to an Array 
        String[] arr = sl1.toArray();
        
    }
}
```

info> Be sure to look at the offical Java Documentation to get a complete list of all the methods available. 

The above snippet declares two `HashSet`s that contain the `String` values, as indicated by the `<>` syntax. Four methods are also called on the `HashSet`: 

1. `.add` - inserts a new element into the set
2. `.addAll` - combines two sets,  removing all duplicates since a `Set` cannot contain duplicates
3. `.contains` - returns `true` if the specified value is in the `Set`
4. `.toArray` - returns an array containing all the elements in the calling `Set`

Using the information in this snippet, remove and replace the data and methods to practice using `HashSet`s.  