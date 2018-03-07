Hold your horses! We need some extra measures to build a truly robust form. Imagine what would happen if the user were to submit the form without entering any values?

We could fill our database with bad data or see an exception for data integrity violations. We clearly need a way of keeping invalid data out of our system!

To express our validations in a test, we need to wonder: what _would_ happen if our validations failed? One option would be to re-render the `books#new` form, so we can give our users another shot at completing it correctly. Let's specify this behaviour as unit tests:
    
    
    # spec/web/controllers/books/create_spec.rb
    require_relative '../../../spec_helper'
    
    describe Web::Controllers::Books::Create do
      let(:action) { Web::Controllers::Books::Create.new }
      let(:repository) { BookRepository.new }
    
      before do
        repository.clear
      end
    
      describe 'with valid params' do
        let(:params) { Hash[book: { title: 'Confident Ruby', author: 'Avdi Grimm' }] }
    
        it 'creates a book' do
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
    
      describe 'with invalid params' do
        let(:params) { Hash[book: {}] }
    
        it 'returns HTTP client error' do
          response = action.call(params)
          response[0].must_equal 422
        end
    
        it 'dumps errors in params' do
          action.call(params)
          errors = action.params.errors
    
          errors.dig(:book, :title).must_equal  ['is missing']
          errors.dig(:book, :author).must_equal ['is missing']
        end
      end
    end
    

Now our tests specify two alternative scenarios: our original happy path, and a new scenario in which validations fail. To make our tests pass, we need to implement validations.

Although you can add validation rules to the entity, Hanami also allows you to define validation rules as close to the source of the input as possible, i.e. the action. Hanami controller actions can use the `params` class method to define acceptable incoming parameters.

This approach both whitelists what params are used (others are discarded to prevent mass-assignment vulnerabilities from untrusted user input) _and_ adds rules to define what values are acceptable — in this case we've specified that the nested attributes for a book's title and author should be present.

With our validations in place, we can limit our entity creation and redirection to cases where the incoming params are valid:
    
    
    # apps/web/controllers/books/create.rb
    module Web::Controllers::Books
      class Create
        include Web::Action
    
        expose :book
    
        params do
          required(:book).schema do
            required(:title).filled(:str?)
            required(:author).filled(:str?)
          end
        end
    
        def call(params)
          if params.valid?
            @book = BookRepository.new.create(params[:book])
    
            redirect_to '/books'
          else
            self.status = 422
          end
        end
      end
    end
    

When the params are valid, the Book is created and the action redirects to a different URL. But when the params are not valid, what happens?

First, the HTTP status code is set to [422 (Unprocessable Entity)][38]. Then the control will pass to the corresponding view, which needs to know which template to render. In this case `apps/web/templates/books/new.html.erb` will be used to render the form again.
    
    
    # apps/web/views/books/create.rb
    module Web::Views::Books
      class Create
        include Web::View
        template 'books/new'
      end
    end
    

This approach will work nicely because Hanami's form builder is smart enough to inspect the `params` in this action and populate the form fields with values found in the params. If the user fills in only one field before submitting, they are presented with their original input, saving them the frustration of typing it again.

Run your tests again and see they are all passing again!
