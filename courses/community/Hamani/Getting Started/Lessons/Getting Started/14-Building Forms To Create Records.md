One of the last remaining steps is to make it possible to add new books to the system. The plan is simple: we build a page with a form to enter details.

When the user submits the form, we build a new entity, save it, and redirect the user back to the book listing. Here's that story expressed in a test:
    
```rb    
# spec/web/features/add_book_spec.rb
require 'features_helper'

describe 'Add a book' do
  after do
    BookRepository.new.clear
  end

  it 'can create a new book' do
    visit '/books/new'

    within 'form#book-form' do
      fill_in 'Title',  with: 'New book'
      fill_in 'Author', with: 'Some author'

      click_button 'Create'
    end

    current_path.must_equal('/books')
    assert page.has_content?('New book')
  end
end
```
