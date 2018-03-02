Create **/views/genre_detail.pug** and fill it with the text below:
    
    
    extends layout
    
    block content
    
      **h1 Genre: #{genre.name}**
      
      div(style='margin-left:20px;margin-top:20px')
    
        h4 Books
        
        dl
        each book in genre_books
          dt 
            a(href=book.url) #{book.title}
          dd #{book.summary}
    
        else
          p This genre has no books
    

The view is very similar to all our other templates. The main difference is that we don't use the `title` passed in for the first heading (though it is it is used in the underlying **layout.pug** template to set the page title).
