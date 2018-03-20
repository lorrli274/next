To create a new Hanami project, we need to install the Hanami gem from Rubygems. Then we can use the new `hanami` executable to generate a new project:
    
 ```sh   
$ gem install hanami
$ hanami new bookshelf
```

By default, the project will be setup to use a SQLite database. For real-world projects, you can specify your engine: `$ hanami new bookshelf --database=postgres`.

This will create a new directory `bookshelf` in our current location. Let's see what it contains:
    
```sh    
$ cd bookshelf
$ tree -L 1
.
├── Gemfile
├── Rakefile
├── apps
├── config
├── config.ru
├── db
├── lib
├── public
└── spec

6 directories, 3 files
```

Here's what we need to know:

* **`Gemfile`** defines our Rubygems dependencies (using Bundler).
* **`Rakefile`** describes our Rake tasks.
* **`apps`** contains one or more web applications compatible with Rack. Here we can find the first generated Hanami application called **`Web`**. It's the place where we find our controllers, views, routes and templates.
* **`config`** contains configuration files.
* **`config.ru`** is for Rack servers.
* **`db`** contains our database schema and migrations.
* **`lib`** contains our business logic and domain model, including entities and repositories.
* **`public`** will contain compiled static assets.
* **`spec`** contains our tests.

Go ahead and install our gem dependency with Bundler; then we can launch a development server:

```sh
$ bundle install
$ bundle exec hanami server --host=0.0.0.0
```

info> You don't typically need the `--host=0.0.0.0`, but your server is running in a cloud box (not your local machine), so this enables remote connections (like the ones made from this page!).

And... bask in the glory of your first Hanami project at [http://localhost:2300]({{localhost:2300}})! We should see a screen similar to this:

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Hanami/welcome-page.png)
