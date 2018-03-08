Open **/views/bookinstance_list.pug** and replace `due_back` with `due_back_formatted`.
    
    
          if val.status!='Available'
            
            span  (Due: #{val.due_back_formatted} )       

That's it. If you go to _All book-instances_ in the sidebar, you should now see all the due dates are far more attractive!

 
