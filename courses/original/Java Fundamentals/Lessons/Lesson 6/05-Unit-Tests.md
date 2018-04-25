## Unit Tests

Unit testing is a means of running a "behavioral inspection" on set piece of code. Unit tests help programmers verify that code sequences execute, return and function properly in the correct states. This section will provide a basic understanding of what unit tests are and how to use them. A more comprehensive look at unit testing with JUnit is covered in the short tutorial course **JUnit Testing**. 

Unit testing code allows developers to run a large sequence of tests against their code base which can help speed up code maintenance and patching. It can help catch issues introduced in new versions of Java (or other languages) without needing to run test manually, and can indicate the efficieny of different code sequences, a way to improve code performance. 

**JUnit** is a common testing framework and the will be the focus of this lesson.

info> JUnit is preinstalled on the Java stack and on Codevolve platform. 

At first, writing tests may seem redundant, entire classess and directories are created to test the functionality of other classess and  methods. Typically, JUnit tests live in the `src/tests/java` folder. Below is an example of `MyTestRunner.java` which contains example code for testing a class. 

```java
import org.junit.*
public class MyTestRunner {
    // required annotation to identify method as a test method
	@Test
    public void AddSalesTaxMethodShouldAddTheRequiredSalesTaxToBillOfSale() {
    	// instantiate an instance of the class containing the method to be tested
    	MyClass testClass = new MyClass();
    	//Assert statements
    	assertEquals(0, testClass.addSalesTax(), "Message to display");
    	assertTrue(0, testClass.addSalesTax(), "Message to display");
    	assertFalse(0, testClass.addSalesTax(), "Message to display");
    }
}
```

The above code block contains the class `MyTestRunner` is setup to instantiate instances of a class to test methods.  The `@Test` annotation is requred for the class to the identify the following method as a test method. `AddSalesTaxMethodShouldAddTheRequiredSalesTaxToBillOfSale()` is a lenghty method name where the description of the purpose of the test method is included in the nomenclature. 

Withing `AddSalesTaxMethodShouldAddTheRequiredSalesTaxToBillOfSale()` are three `assert` statements. Each `assert` statement runs the method to be tested and compares it to the expected result under the circumstances provided. Using a number of `assert` statements to cover a large range of variations, referred to as **test coverage**, will ensure the methods tested are well written and can handle a variety of circumstances, hopefully catching any edge cases. 

