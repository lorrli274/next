Let's modify the generated migration (the path to the migration will differ for you, because it contains a timestamp) to include `title` and `author` fields:
    
```rb    
# db/migrations/20161115110038_create_books.rb

Hanami::Model.migration do
  change do
    create_table :books do
      primary_key :id

      column :title,  String, null: false
      column :author, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
```    

Hanami provides a DSL to describe changes to our database schema. You can read more about how migrations work in the [migrations' guide](http://hanamirb.org/guides/1.0/migrations/overview).

In this case, we define a new table with columns for each of our entities' attributes. Let's prepare our database for the development and test environments:
    
```sh    
$ bundle exec hanami db prepare
$ HANAMI_ENV=test bundle exec hanami db prepare
```    
