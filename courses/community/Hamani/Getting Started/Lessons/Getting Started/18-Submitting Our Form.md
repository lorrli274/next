To submit our form, we need yet another action. Let's create a `Books::Create` action:
    
    
    % bundle exec hanami generate action web books#create
    

This adds a new route to our app:
    
    
    # apps/web/config/routes.rb
    post '/books', to: 'books#create'
