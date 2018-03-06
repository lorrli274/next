Create **/views/author_delete.pug** and copy in the text below.
    
    
    extends layout
    
    block content
      h1 #{title}: #{author.name}
      p= author.lifespan
      
      if author_books.length
      
        p #[strong Delete the following books before attempting to delete this author.]
      
        div(style='margin-left:20px;margin-top:20px')
    
          h4 Books
        
          dl
          each book in author_books
            dt 
              a(href=book.url) #{book.title}
            dd #{book.summary}
    
      else
        p Do you really want to delete this Author?
        
        form(method='POST' action='')
          div.form-group
            input#authorid.form-control(type='hidden',name='authorid', required='true', value=author._id )
    
          button.btn.btn-primary(type='submit') Delete

The view extends the layout template, overriding the block named `content`. At the top it displays the author details. It then includes a conditional statement based on the number of `**author_books**` (the `if` and `else` clauses).

* If there _are_ books associated with the author then the page lists the books and states that these must be deleted before this `Author` may be deleted.
* If there _are no_ books then the page displays a confirmation prompt. If the **Delete** button is clicked then the author id is sent to the server in a `POST` request and that author's record will be deleted.
