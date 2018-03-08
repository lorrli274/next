Let's use our new knowledge about the major Hanami components to add a new action. The purpose of our Bookshelf project is to manage books.

We'll store books in our database and let the user manage them with our project. A first step would be to show a listing of all the books in our system.

Let's write a new feature test describing what we want to achieve:
    
```rb    
# spec/web/features/list_books_spec.rb
require 'features_helper'

describe 'List books' do
  it 'displays each book on the page' do
    visit '/books'

    within '#books' do
      assert page.has_css?('.book', count: 2), 'Expected to find 2 books'
    end
  end
end
```    

The test is simple enough, and fails because the URL `/books` is not currently recognised in our application. We'll create a new controller action to fix that.
