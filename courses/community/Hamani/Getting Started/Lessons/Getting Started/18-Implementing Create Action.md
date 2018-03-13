Our `books#create` action needs to do two things. Let's express them as unit tests:
    
```ruby    
# spec/web/controllers/books/create_spec.rb
require_relative '../../../spec_helper'

describe Web::Controllers::Books::Create do
  let(:action) { Web::Controllers::Books::Create.new }
  let(:params) { Hash[book: { title: 'Confident Ruby', author: 'Avdi Grimm' }] }
  let(:repository) { BookRepository.new }

  before do
    repository.clear
  end

  it 'creates a new book' do
    action.call(params)
    book = repository.last

    book.id.wont_be_nil
    book.title.must_equal params.dig(:book, :title)
  end

  it 'redirects the user to the books listing' do
    response = action.call(params)

    response[0].must_equal 302
    response[1]['Location'].must_equal '/books'
  end
end
```

Let's make these tests pass! We've already seen how we can write entities to our database, and we can use `redirect_to` to implement our redirection:
    
```ruby    
# apps/web/controllers/books/create.rb
module Web::Controllers::Books
  class Create
    include Web::Action

    def call(params)
      BookRepository.new.create(params[:book])

      redirect_to '/books'
    end
  end
end
```

This minimal implementation should suffice to make our tests pass.
    
```sh    
$ bundle exec rake
Run options: --seed 63592

# Running:

...S.S.........

Finished in 0.081961s, 183.0142 runs/s, 305.0236 assertions/s.

15 runs, 23 assertions, 0 failures, 0 errors, 2 skips

You have skipped tests. Run with --verbose for details.
```

Congratulations!
