To avoid repeating ourselves in every single template, we can use a layout. Open up the file `apps/web/templates/application.html.erb` and edit it to look like this:
    
 ```   
    
    
      
        
        <%= favicon %>
      
      
        
Bookshelf

        <%= yield %>
```      
    
    

Now you can remove the duplicate lines from the other templates. Let's run the tests again to check that everything worked fine:
    
```    
    bundle exec rake test
```    

A **layout** is like any other template, but it is used to wrap your regular templates. The `yield` line is replaced with the contents of our regular template. It's the perfect place to put our repeating headers and footers.
