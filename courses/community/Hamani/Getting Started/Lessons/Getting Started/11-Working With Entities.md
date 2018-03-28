An **entity** is something really close to a plain Ruby object. We should focus on the behaviors that we want from it and only then, how to save it.

For now, we keep the generated entity class:
    
```ruby    
# lib/bookshelf/entities/book.rb
class Book < Hanami::Entity
end
```

This class will generate getters and setters for each attribute which we pass to initialize params. We can verify it all works as expected with a unit test:
    
```ruby   
# spec/bookshelf/entities/book_spec.rb
require_relative '../../spec_helper'

describe Book do
  it 'can be initialized with attributes' do
    book = Book.new(title: 'Refactoring')
    book.title.must_equal 'Refactoring'
  end
end
```
