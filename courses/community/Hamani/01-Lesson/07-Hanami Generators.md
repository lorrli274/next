Hanami ships with various **generators** to save on typing some of the code involved in adding new functionality. In our terminal, enter:
    
    
    % bundle exec hanami generate action web books#index
    

This will generate a new action _index_ in the _books_ controller of the _web_ application. It gives us an empty action, view and template; it also adds a default route to `apps/web/config/routes.rb`:
    
    
    get '/books', to: 'books#index'
    

If you're using ZSH, you may get `zsh: no matches found: books#index`. In that case, you can use: ` % hanami generate action web books/index `

To make our test pass, we need to edit our newly generated template file in `apps/web/templates/books/index.html.erb`:
