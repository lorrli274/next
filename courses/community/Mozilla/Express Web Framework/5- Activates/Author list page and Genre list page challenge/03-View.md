Create */views/author_list.pug* and replace its content with the text below.
    
```js    
extends layout

block content
  h1= title

  ul
  each author in author_list
    li 
      a(href=author.url) #{author.name} 
      | (#{author.date_of_birth} - #{author.date_of_death})

  else
    li There are no authors.
```

The **view** follows exactly the same pattern as our other templates.
