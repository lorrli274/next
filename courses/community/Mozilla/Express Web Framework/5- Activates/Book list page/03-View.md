Create */views/book_list.pug* and copy in the text below.
    
```js    
extends layout

block content
  h1= title

  ul
  each book in book_list
    li 
      a(href=book.url) #{book.title} 
      |  (#{book.author.name})

  else
    li There are no books.
```

The **view extends** the *layout.pug* base template and overrides the `block` named 'content'. It displays the `title` we passed in from the controller (via the `render()` method) and then iterates through the `book_list` variable using the `each`-`in`-`else` syntax. A list item is created for each book displaying the book title as a link to the book's detail page followed by the author name. If there are no books in the `book_list` then the `else` clause is executed, and displays the text 'There are no books.'

info> We use `book.url` to provide the link to the detail record for each book (we've implemented this route, but not the page yet). This is a virtual property of the `Book` model which uses the model instance's `_id` field to produce a unique URL path.

Of interest here is that each book is defined as two lines, using the pipe for the second line (highlighted above). This approach is needed because if the author name were on the previous line then it would be part of the hyperlink.
