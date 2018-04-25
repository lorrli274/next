## Regular Expressions 

**Regular Expressions** are a nifty way of creating `String` search patterns algorithms that can match sequences in a `String`. Regular expressions, also known and commonly referred to as **regex** can be setup to determine the contents of `String`s for text analysis, search engines, input verification, and many other use cases. 

In Java, regex can be written as a `String` where the `String` is passed into a method looking for a regex pattern. Regex patterns can be confusing at first, mainly because they implement a lot of metacharacters and symbols such as `\s`, `\W`, `$`, and `^` all concatenated into a messy single line expression. 

```java
String email = "someone@gmail.com"
String pattern = "^+\w+\\@+\w+\.+[com]$"
    if(email.matches(pattern)) {
        // valid email address
    }
```

The above regex pattern matches email addresses, requiring an `@` and a `.com` preceded by text. A pattern like this may be used to search a input medium for a valid email address pattern. However, this may look very jumbled..and that is becuase it is. Using a regex cheatsheet is a must when starting out until some of the patterns can be committed to memory. 

Below is a table containing some of the commong regex symbols and metacharacters along with their purpose. 

## Symbols and Characters

| Symbols / Meta Characters |                         Description                          |
| :-----------------------: | :----------------------------------------------------------: |
|            `^`            |      Indicates the start of a `String` or line of text       |
|            `$`            |       Indicates the end of a `String` or line of text        |
|           [...]           |                Matches characters in brackets                |
|           (...)           |                       Capturing group                        |
|           {...}           |                  Indicates range of matches                  |
|            `.`            |         Any character except new line or line break          |
|            `+`            |       One or more of the preceding character, "greedy"       |
|            `?`            | Makes symbol or meta character "lazy". Lazy indicates the minimum to pass |
|           `\\`            |           Escape character for special characters            |
|            `|`            |                              Or                              |
|            \d             |                       Digit character                        |
|            \D             |                     Non-degit character                      |
|            \s             |                     Whitespace character                     |
|            \S             |                   Non-whitespace character                   |
|            \w             |                        Word character                        |
|            \W             |                      Non-word character                      |

The above table contains a list of some of the common expressions (and is by no means comprehensive). For more information on regex Google regex cheat sheets to learn more about the range of possibilities, description of symbols and characters, and examples. 