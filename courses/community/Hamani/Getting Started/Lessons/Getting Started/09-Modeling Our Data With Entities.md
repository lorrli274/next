Hard-coding books in our templates is, admittedly, kind of cheating. Let's add some dynamic data to our application.

We'll store books in our database and display them on our page. To do so, we need a way to read and write to our database. Enter entities and repositories:

* an **entity** is a domain object (eg. `Book`) uniquely identified by its identity.
* a **repository** mediates between entities and the persistence layer.

Entities are totally unaware of the database. This makes them lightweight and easy to test.

For this reason we need a repository to persist the data that a `Book` depends on. Read more about entities and repositories in the [models guide](http://hanamirb.org/guides/1.0/models/overview).

Hanami ships with a generator for models, so let's use it to create a `Book` entity and the corresponding repository:
    
```sh    
% bundle exec hanami generate model book
create  lib/bookshelf/entities/book.rb
create  lib/bookshelf/repositories/book_repository.rb
create  db/migrations/20161115110038_create_books.rb
create  spec/bookshelf/entities/book_spec.rb
create  spec/bookshelf/repositories/book_repository_spec.rb
```    

The generator gives us an entity, a repository, a migration, and accompanying test files.
