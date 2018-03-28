Now we are ready to play around with our repository. We can use Hanami's `console` command to launch IRb with our application pre-loaded, so we can use our objects:
    
```    
$ bundle exec hanami console
>> repository = BookRepository.new
=> => #<BookRepository relations=[:books]>
>> repository.all
=> []
>> book = repository.create(title: 'TDD', author: 'Kent Beck')
=> #<Book:0x007f9ab61c23b8 @attributes={:id=>1, :title=>"TDD", :author=>"Kent Beck", :created_at=>2016-11-15 11:11:38 UTC, :updated_at=>2016-11-15 11:11:38 UTC}>
>> repository.find(book.id)
=> #<Book:0x007f9ab6181610 @attributes={:id=>1, :title=>"TDD", :author=>"Kent Beck", :created_at=>2016-11-15 11:11:38 UTC, :updated_at=>2016-11-15 11:11:38 UTC}>
```

Hanami repositories have methods to load one or more entities from our database; and to create and update existing records. The repository is also the place where you would define new methods to implement custom queries.

To recap, we've seen how Hanami uses entities and repositories to model our data. Entities represent our behavior, while repositories use mappings to translate our entities to our data store. We can use migrations to apply changes to our database schema.
