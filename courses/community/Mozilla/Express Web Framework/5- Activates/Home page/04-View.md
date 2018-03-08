Open */views/index.pug* and replace its content with the text below.
    
```js    
extends layout

block content
  h1= title
  p Welcome to #[em LocalLibrary], a very basic Express website developed as a tutorial example on the Mozilla Developer Network.

  h1 Dynamic content

  if error
    p Error getting dynamic content.
  else
    p The library has the following record counts:

    ul
      li #[strong Books:] !{data.book_count}
      li #[strong Copies:] !{data.book_instance_count}
      li #[strong Copies available:] !{data.book_instance_available_count} 
      li #[strong Authors:] !{data.author_count}
      li #[strong Genres:] !{data.genre_count}
```

The **view** is straightforward. We extend the *layout.pug* base template, overriding the `block` named 'content'. The first `h1` heading will be the escaped text for the `title` variable that was passed into the `render()` function—note the use of the '`h1=`' so that the following text is treated as a JavaScript expression. We then include a paragraph introducing the LocalLibrary.

Under the Dynamic content heading we check whether the error variable passed in from the `render()` function has been defined. If so, we note the error. If not, we get and list the number of copies of each model from the `data` variable.

info> We didn't escape the count values (i.e. we used the `!{}` syntax) because the count values are calculated. If the information was supplied by end-users then we'd escape the variable for display.
