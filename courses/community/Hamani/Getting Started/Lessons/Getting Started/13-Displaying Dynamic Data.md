With our new experience modelling data, we can get to work displaying dynamic data on our book listing page. Let's adjust the feature test we created earlier:
    
```rb    
# spec/web/features/list_books_spec.rb
require 'features_helper'

describe 'List books' do
  let(:repository) { BookRepository.new }
  before do
    repository.clear

    repository.create(title: 'PoEAA', author: 'Martin Fowler')
    repository.create(title: 'TDD',   author: 'Kent Beck')
  end

  it 'displays each book on the page' do
    visit '/books'

    within '#books' do
      assert page.has_css?('.book', count: 2), 'Expected to find 2 books'
    end
  end
end
```    

We create the required records in our test and then assert the correct number of book classes on the page. When we run this test it should pass. If it does not pass, a likely reason is that the test database was not migrated.

Now we can go change our template and remove the static HTML. Our view needs to loop over all available records and render them. Let's write a test to force this change in our view:
    
```rb    
    # spec/web/views/books/index_spec.rb
    require_relative '../../../spec_helper'
    
    describe Web::Views::Books::Index do
      let(:exposures) { Hash[books: []] }
      let(:template)  { Hanami::View::Template.new('apps/web/templates/books/index.html.erb') }
      let(:view)      { Web::Views::Books::Index.new(template, exposures) }
      let(:rendered)  { view.render }
    
      it 'exposes #books' do
        view.books.must_equal exposures.fetch(:books)
      end
    
      describe 'when there are no books' do
        it 'shows a placeholder message' do
          rendered.must_include('
There are no books yet.

')
        end
      end
    
      describe 'when there are books' do
        let(:book1)     { Book.new(title: 'Refactoring', author: 'Martin Fowler') }
        let(:book2)     { Book.new(title: 'Domain Driven Design', author: 'Eric Evans') }
        let(:exposures) { Hash[books: [book1, book2]] }
    
        it 'lists them all' do
          rendered.scan(/class="book"/).count.must_equal 2
          rendered.must_include('Refactoring')
          rendered.must_include('Domain Driven Design')
        end
    
        it 'hides the placeholder message' do
          rendered.wont_include('
There are no books yet.

')
        end
      end
    end
```    

We specify that our index page will show a simple placeholder message when there are no books to display; when there are, it lists every one of them. Note how rendering a view with some data is relatively straight-forward. Hanami is designed around simple objects with minimal interfaces that are easy to test in isolation, yet still work great together.

Let's rewrite our template to implement these requirements:
    
```    
    # apps/web/templates/books/index.html.erb
    
All books

    
    <% if books.any? %>
      

        <% books.each do |book| %>
          

            
<%= book.title %>

            
<%= book.author %>


          

        <% end %>
      

    <% else %>
      
There are no books yet.


    <% end %>
```    

If we run our feature test now, we'll see it fails — because our controller action does not actually [_expose_][29] the books to our view. We can write a test for that change:
    
            
    # spec/web/controllers/books/index_spec.rb
    require_relative '../../../spec_helper'
    
    describe Web::Controllers::Books::Index do
      let(:action) { Web::Controllers::Books::Index.new }
      let(:params) { Hash[] }
      let(:repository) { BookRepository.new }
    
      before do
        repository.clear
    
        @book = repository.create(title: 'TDD', author: 'Kent Beck')
      end
    
      it 'is successful' do
        response = action.call(params)
        response[0].must_equal 200
      end
    
      it 'exposes all books' do
        action.call(params)
        action.exposures[:books].must_equal [@book]
      end
    end
    

Writing tests for controller actions is basically two-fold: you either assert on the response object, which is a Rack-compatible array of status, headers and content; or on the action itself, which will contain exposures after we've called it. Now we've specified that the action exposes `:books`, we can implement our action:
    
    
    # apps/web/controllers/books/index.rb
    module Web::Controllers::Books
      class Index
        include Web::Action
    
        expose :books
    
        def call(params)
          @books = BookRepository.new.all
        end
      end
    end
    

By using the `expose` method in our action class, we can expose the contents of our `@books` instance variable to the outside world, so that Hanami can pass it to the view. That's enough to make all our tests pass again!
    
    
    % bundle exec rake
    Run options: --seed 59133
    
    # Running:
    
    .........
    
    Finished in 0.042065s, 213.9543 runs/s, 380.3633 assertions/s.
    
    9 runs, 16 assertions, 0 failures, 0 errors, 0 skips
    
