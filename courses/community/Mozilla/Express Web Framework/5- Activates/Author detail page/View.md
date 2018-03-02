Create **/views/author_detail.pug** and copy in the following text.
    
    
    extends layout
    
    block content
    
    **  h1 Author: #{author.name}**
      p #{author.date_of_birth} - #{author.date_of_death}
      
      div(style='margin-left:20px;margin-top:20px')
    
        h4 Books
        
        dl
        each book in author_books
          dt 
            a(href=book.url) #{book.title}
          dd #{book.summary}
    
        else
          p This author has no books.
    

Everything in this template has been demonstrated in previous sections.
