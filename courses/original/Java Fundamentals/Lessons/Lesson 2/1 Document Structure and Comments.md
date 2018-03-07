## Activity 3: Document Structure

### Document Structure and Comments

In this section we will briefly touch on the document structure in Java and the importance of comments. 

Comments serve a few different purposes in writing code. 

1. Document headers
2. Documentation / Javadoc
3. Variable explanation
4. Methodology reasoning
5. Reminders
6. TODOs

Comments can be written using three different symbols in Java. The most common is the double forward slash `//`. This is generally used for one line comments, explanations, and notes. 

Multi-line comments, or comment blocks, are created using a single forward slash and a single asterisk `/*` and end with an single asterisk and a single forward slash `*/`. Comment blocks can be used where using double forward slash `//` would be too tedious and messy. 

Often programmers want to add documentation to their methods, or classes that the IDE can read and display somewhere else during the development cycle or when the source code is being used by another team or project. This is accomplished using a single forward slash and a double asterisk `/**` and closes with a single asterisk and single forward slash `*/`. This indicates to the compiler and the IDE that the comment block is a **Javadoc** and it generates documentation so that it can be accessed elsewhere. 

```java
/**
	Header - information about the program, file, or class goes in the header. This 	contains information about the purpose, functions, author(s), version, date of 		creation, last modified, etc.
	* Author ..
	* Version ..
	* Created on..
*/

//Import Statements - these import libraries and their classes into your document for use. 
import java.io.*;

public class Example {
	/* 
	Variables - variables that are be access publically throughout the document are 	placed before the main() so that they have scope throughout the entire document.
  	*/
	private static final String GREETING = "Hello World!";
	public static void main(String[] args) {
  	/* 
  	This is the main program. it is static so there is only one instance and it is 		used as the starting point for the program to run. This is where variables and 		functions calls will be
  	*/
  		myFunc(myString);
	}

	// Functions
	/**
	* Function prints out the msg.
	* @param String msg
	* @return Void
	*/
	public void myFunc(String msg) {
  	System.out.println(msg);
	}
}
```

> Should be able to generate a terminal example to access Javadoc generated documentation. 