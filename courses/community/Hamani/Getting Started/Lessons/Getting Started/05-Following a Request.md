Now we have a test, we can see it fail:
    
```sh    
$ bundle exec rake test
Run options: --seed 44759

# Running:

F

Finished in 0.018611s, 53.7305 runs/s, 53.7305 assertions/s.

  1) Failure:
Homepage#test_0001_is successful [/Users/hanami/bookshelf/spec/web/features/visit_home_spec.rb:6]:
Expected "nn  n    n  n  n    
Not Found
n  nn" to include "Bookshelf".

1 runs, 1 assertions, 1 failures, 0 errors, 0 skips
```    

Now let's make it pass. Lets add the code required to make this test pass, step-by-step.

The first thing we need to add is a route:
    
```rb    
# apps/web/config/routes.rb
root to: 'home#index'
```    

We pointed our application's root URL to the `index` action of the `home` controller (see the [routing guide](http://hanamirb.org/guides/1.0/routing/overview) for more information). Now we can create the index action.
    
```rb    
# apps/web/controllers/home/index.rb
module Web::Controllers::Home
  class Index
    include Web::Action

    def call(params)
    end
  end
end
```    

This is an empty action that doesn't implement any business logic. Each action has a corresponding view, which is a Ruby object and needs to be added in order to complete the request.
    
```rb    
# apps/web/views/home/index.rb
module Web::Views::Home
  class Index
    include Web::View
  end
end
```    

...which, in turn, is empty and does nothing more than render its template. This is the file we need to edit in order to make our test pass. All we need to do is add the bookshelf heading.
    
```rb    
    # apps/web/templates/home/index.html.erb
    
Bookshelf
```
    

Save your changes, run your test again and it now passes. Great!
    
```rb    
Run options: --seed 19286

# Running:

.

Finished in 0.011854s, 84.3600 runs/s, 168.7200 assertions/s.

1 runs, 2 assertions, 0 failures, 0 errors, 0 skips
```
