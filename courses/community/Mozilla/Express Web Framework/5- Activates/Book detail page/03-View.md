Create */views/book_detail.pug* and add the text below.
    
```js    
extends layout

block content
  h1 #{title}: #{book.title}

  p #[strong Author:] 
    a(href=book.author.url) #{book.author.name}
  p #[strong Summary:] #{book.summary}
  p #[strong ISBN:] #{book.isbn}
  p #[strong Genre:] 
    each val, index in book.genre
      a(href=val.url) #{val.name}
      if index < book.genre.length - 1
        |, 

  div(style='margin-left:20px;margin-top:20px')
    h4 Copies

    each val in book_instances
      hr
      if val.status=='Available'
        **p.text-success** #{val.status}
      else if val.status=='Maintenance'
        p.text-danger #{val.status}
      else
        p.text-warning #{val.status} 
      p #[strong Imprint:] #{val.imprint}
      if val.status!='Available'
        p #[strong Due back:] #{val.due_back}
      p #[strong Id:] 
        a(href=val.url) #{val._id}

    else
      p There are no copies of this book in the library.
```

Almost everything in this template has been demonstrated in previous steps.

info> The list of genres associated with the book is implemented in the template as below. This adds a comma after every genre associated with the book except for the last one.
    
```js    
p #[strong Genre:]
each val, index in book.genre
  a(href=val.url) #{val.name}
  if index < book.genre.length - 1
    |, 
```