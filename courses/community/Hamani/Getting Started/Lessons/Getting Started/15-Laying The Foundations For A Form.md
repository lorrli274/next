By now, we should be familiar with the working of actions, views and templates.

We'll speed things up a little, so we can quickly get to the good parts. First, create a new action for our "New Book" page:
    
```sh    
$ bundle exec hanami generate action web books#new
```    

This adds a new route to our app:
    
```rb    
# apps/web/config/routes.rb
get '/books/new', to: 'books#new'
```    

The interesting bit will be our new template, because we'll be using Hanami's form builder to construct a HTML form around our `Book` entity.
