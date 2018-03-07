The example template file below shows off many of Pug's most useful features.

The first thing to notice is that the file maps the structure of a typical HTML file, with the first word in (almost) every line being an HTML element, and indentation being used to indicate nested **elements**. So for example, the `body` element is inside an `html` element, and paragraph elements (`p`) are within the `body` element, etc. Non-nested elements (e.g. individual paragraphs) are on separate lines.
    
```js    
doctype html
html(lang="en")
  head
    title= title
    script(type='text/javascript').
  body
    h1= title

    p This is a line with #[em some emphasis] and #[strong strong text] markup.
    p This line has un-escaped data: !{' is emphasised'} and escaped data: #{' is not emphasised'}. 
      | This line follows on.
    p= 'Evaluated and escaped expression:' + title


    // You can add single line JavaScript comments and they are generated to HTML comments
    //- Introducing a single line JavaScript comment with "//-" ensures the comment isn't rendered to HTML 

    p A line with a link 
      a(href='https://developer.mozilla.org/catalog/authors') Some link text
      |  and some extra text.

    #container.col
      if title
        p A variable named "title" exists.
      else
        p A variable named "title" does not exist.
      p.
        Pug is a terse and simple template language with a
        strong focus on performance and powerful features.

    h2 Generate a list

    ul
      each val in [1, 2, 3, 4, 5]
        li= val
```

Element attributes are defined in parentheses after their associated element. Inside the parentheses, the attributes are defined in comma- or whitespace- separated lists of the pairs of attribute names and attribute values, for example:

* `script(type='text/javascript')`, `link(rel='stylesheet', href='https://developer.mozilla.org/stylesheets/style.css')`
* `meta(name='viewport' content='width=device-width initial-scale=1')`

The values of all attributes are **escaped** (e.g. characters like "`>`" are converted to their HTML code equivalents like "`>"`) to prevent injection of JavaScript/cross-site scripting attacks.

If a tag is followed by the equals sign, the following text is treated as a JavaScript **expression**. So for example, in the first line below, the content of the `h1` tag will be **variable** `title` (either defined in the file or passed into the template from Express). In the second line the paragraph content is a text string concatented with the `title` variable. In both cases the default behaviour is to **escape** the line.
    
```js    
h1= title 
p= 'Evaluated and escaped expression:' + title
```

If there is no equals symbol after the tag then the content is treated as plain text. Within the plain text you can insert escaped and unescaped data using the `#{}` and` !{}` syntax, as shown below. You can also add raw HTML within the plain text.
    
```js    
p This is a line with #[em some emphasis] and #[strong strong text] markup. 
p This line has an un-escaped string: !{' is emphasised'}, an escaped string: #{' is not emphasised'}, and escaped variables: #{title}.
```

Info> You will almost always want to escape data from users (via the **`#{}`** syntax). Data that can be trusted (e.g. generated counts of records, etc.) may be be displayed without escaping the values.

You can use the pipe ('**|**') character at the beginning of a line to indicate [plain text](https://pugjs.org/language/plain-text.html). For example, the additional text shown below will be displayed on the same line as the preceding anchor, but will not be linked.
    
```js    
a(href='http://someurl/') Link text
| Plain text
```

Pug allows you to perform conditional operations using `if`, `else` , `else if` and `unless`—for example:
    
```js    
if title
  p A variable named "title" exists
else
  p A variable named "title" does not exist
```

You can also perform loop/iteration operations using `each-in` or `while` syntax. In the code fragment below we've looped through an array to display a list of variables (note the use of the 'li=' to evaluate the "val" as a variable below. The value you iterate across can also be passed into the template as a variable!
    
```js    
ul
  each val in [1, 2, 3, 4, 5]
    li= val
```

The syntax also supports comments (that can be rendered in the output—or not—as you choose), mixins to create reusable blocks of code, case statements, and many other features. For more detailed information see [The Pug docs](https://pugjs.org/api/getting-started.html).
