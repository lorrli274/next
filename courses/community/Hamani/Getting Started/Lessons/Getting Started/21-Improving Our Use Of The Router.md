The last improvement we are going to make, is in the use of our router. Open up the routes file for the "web" application:
    
```ruby    
# apps/web/config/routes.rb
post '/books',    to: 'books#create'
get '/books/new', to: 'books#new'
get '/books',     to: 'books#index'
root              to: 'home#index'
```

Hanami provides a convenient helper method to build these REST-style routes, that we can use to simplify our router a bit:
    
```
root to: 'home#index'
resources :books, only: [:index, :new, :create]
```

To get a sense of what routes are defined, now we've made this change, you can run `bundle exec hanami routes` on your command-line to inspect the end result:
    
```    
$ bundle exec hanami routes
     Name Method     Path                           Action

     root GET, HEAD  /                              Web::Controllers::Home::Index
    books GET, HEAD  /books                         Web::Controllers::Books::Index
 new_book GET, HEAD  /books/new                     Web::Controllers::Books::New
    books POST       /books                         Web::Controllers::Books::Create
```

The output shows you the name of the defined helper method (you can suffix this name with `_path` or `_url` and call it on the `routes` helper), the allowed HTTP method, the path and finally the controller action that will be used to handle the request.

Now we've applied the `resources` helper method, we can take advantage of the named route methods. Remember how we built our form using `form_for` in `apps/web/templates/books/new.html.erb`?
    
```erb
<%=
  form_for :book, '/books' do
    # ...
  end
%>
```

We don't need to include a hard-coded path in our template, when our router is already perfectly aware of which route to point the form to. We can use the `routes` helper method that is available in our views and actions to access route-specific helper methods:
    
```erb
<%=
  form_for :book, routes.books_path do
    # ...
  end
%>
```


We can make a similar change in `apps/web/controllers/books/create.rb`:

```ruby
redirect_to routes.books_path
```
