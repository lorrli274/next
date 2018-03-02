Create **/views/bookinstance_detail.pug** and copy in the content below.
    
    
    extends layout
    
    block content
    
    **  h1 ID: #{bookinstance._id}**
      
      p #[strong Title:] 
        a(href=bookinstance.book.url) #{bookinstance.book.title}
      p #[strong Imprint:] #{bookinstance.imprint}
    
      p #[strong Status:] 
        if bookinstance.status=='Available'
          span.text-success #{bookinstance.status}
        else if bookinstance.status=='Maintenance'
          span.text-danger #{bookinstance.status}
        else
          span.text-warning #{bookinstance.status} 
          
      if bookinstance.status!='Available'
        p #[strong Due back:] #{bookinstance.due_back}
    

Everything in this template has been demonstrated in previous sections.

### What does it look like?

Run the application and open your browser to . Select the _All book-instances_ link, then select one of the items. If everything is set up correctly, your site should look something like the following screenshot.

![BookInstance Detail Page - Express Local Library site][1]
