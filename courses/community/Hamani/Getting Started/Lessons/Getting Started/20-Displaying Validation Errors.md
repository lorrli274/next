Rather than just shoving the user a form under their nose when something has gone wrong, we should give them a hint of what's expected of them. Let's adapt our form to show a notice about invalid fields.

First, we expect a list of errors to be included in the page when `params` contains errors:
    
```rb    
# spec/web/views/books/new_spec.rb
require_relative '../../../spec_helper'

describe Web::Views::Books::New do
  let(:params)    { OpenStruct.new(valid?: false, error_messages: ['Title must be filled', 'Author must be filled']) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/new.html.erb') }
  let(:view)      { Web::Views::Books::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    rendered.must_include('There was a problem with your submission')
    rendered.must_include('Title must be filled')
    rendered.must_include('Author must be filled')
  end
end
```    

We should also update our feature spec to reflect this new behavior:
    
```rb    
# spec/web/features/add_book_spec.rb
require 'features_helper'

describe 'Add a book' do
  # Spec written earlier omitted for brevity

  it 'displays list of errors when params contains errors' do
    visit '/books/new'

    within 'form#book-form' do
      click_button 'Create'
    end

    current_path.must_equal('/books')

    assert page.has_content?('There was a problem with your submission')
    assert page.has_content?('Title must be filled')
    assert page.has_content?('Author must be filled')
  end
end
```    

In our template we can loop over `params.errors` (if there are any) and display a friendly message. Open up `apps/web/templates/books/new.html.erb` and add the following at the top of the file:
    
```    
<% unless params.valid? %>
```     

        
There was a problem with your submission

```        

          <% params.error_messages.each do |message| %>
            
<%= message %>

          <% end %>
        

      

    <% end %>
```    

Run your tests again and see they are all passing again!
    
```sh    
% bundle exec rake
Run options: --seed 59940

# Running:

......S..........

Finished in 0.188950s, 89.9707 runs/s, 179.9413 assertions/s.

17 runs, 34 assertions, 0 failures, 0 errors, 1 skips

You have skipped tests. Run with --verbose for details.
```    

### [ ](http://hanamirb.org#improving-our-use-of-the-router)Improving Our Use Of The Router

The last improvement we are going to make, is in the use of our router. Open up the routes file for the "web" application:
    
```rb    
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
    
```sh    
$ bundle exec hanami routes
     Name Method     Path                           Action

     root GET, HEAD  /                              Web::Controllers::Home::Index
    books GET, HEAD  /books                         Web::Controllers::Books::Index
 new_book GET, HEAD  /books/new                     Web::Controllers::Books::New
    books POST       /books                         Web::Controllers::Books::Create
```    

The output shows you the name of the defined helper method (you can suffix this name with `_path` or `_url` and call it on the `routes` helper), the allowed HTTP method, the path and finally the controller action that will be used to handle the request.

Now we've applied the `resources` helper method, we can take advantage of the named route methods. Remember how we built our form using `form_for` in `apps/web/templates/books/new.html.erb`?
    
```    
<%=
  form_for :book, '/books' do
    # ...
  end
%>
```    

We don't need to include a hard-coded path in our template, when our router is already perfectly aware of which route to point the form to. We can use the `routes` helper method that is available in our views and actions to access route-specific helper methods:
    
```    
<%=
  form_for :book, routes.books_path do
    # ...
  end
%>
```    

We can make a similar change in `apps/web/controllers/books/create.rb`:
    
```    
redirect_to routes.books_path
```
