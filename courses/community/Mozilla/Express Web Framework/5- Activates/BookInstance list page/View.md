Create **/views/bookinstance_list.pug** and copy in the text below.
    
    
    extends layout
    
    block content
      h1= title
    
      ul
      each val in bookinstance_list
        li 
          a(href=val.url) #{val.book.title} : #{val.imprint} - 
          if val.status=='Available'
            span.text-success #{val.status}
          else if val.status=='Maintenance'
            span.text-danger #{val.status}
          else
            span.text-warning #{val.status} 
          if val.status!='Available'
            span  (Due: #{val.due_back} )
    
      else
        li There are no book copies in this library.

This view is much the same as all the others. It extends the layout, replacing the _content_ block, displays the `title` passed in from the controller, and iterates through all the book copies in `bookinstance_list`. For each copy we display its status (colour coded) and if the book is not available, its expected return date. One new feature is introduced—we can use dot notation after a tag to assign a class. So `span.text-success` will be compiled to `` (and might also be written in Pug as `span(class="text-success")`.
