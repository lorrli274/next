# Style Guide

The following is the recommended format to use when creating Next.xyz courses.

## Titles
All course, lesson and step titles should be title cased.
* Bad: "This is a title"
* Good: "This is a Title"

## Markdown
All text-based content is written using Github-flavored markdown. In general:
* Break up paragraphs that run on
* Spellcheck and use proper grammar
* Read it like a learner to make sure it makes sense

### Headers
The following logic should be used for formatting headers:
* \# (H1): Major of the instructions. Do not overuse (it's often better to start a new step instead).
* \#\# (H2): Main section of the instructions.
* \#\#\# (H3): Subsection of the instructions.
* \#\#\#\# (H4-H6): Minor section of the instructions.

The resulting styles are shown below:

![](https://github.com/codevolve/next/blob/master/assets/headers.png)


### Filenames
Filenames should be italicized.
* Bad: main.py
* Good: _main.py_

### Input Values
#### Single Value
Single values should be *bolded* inline.
* Bad: Enter 100 as input.
* Good: Enter **100** as input.

#### Multiple Values
Multiple input values should be placed in an unstyled code block:
```
Sam Jones
32
Monday
```

### Code
#### Inline Code
Inline code should be wrapped using backticks (`).
* Bad: Use the def keyword
* Good: Use the `def` keyword

#### Code Blocks
Block code should be syntax highlighted:

    ```python
    def add(x, y):
        return x + y
    ```

### Callouts
The following callouts are supported:

|Markdown|Type|
|--------|----|
|`>`|A default (gray) callout|
|`success>`|A success (green) callout|
|`info>`|An information (blue) callout|
|`warning>`|A warning (yellow) callout|
|`danger>`|A danger (red) callout|
