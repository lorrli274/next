The **URLs** that we're ultimately going to need for our pages are listed below, where _object_ is replaced by the name of each of our models (book, bookinstance, genre, author), _objects_ is the plural of object, and _id_ is the unique instance field (`_id`) that is given to each Mongoose model instance by default.

* `catalog/` — The home/index page.
* `catalog//` — The list of all books, bookinstances, genres, or authors (e.g. /`catalog/books/`, /`catalog/genres/`, etc.)
* `catalog//__` — The detail page for a specific book, bookinstance, genre, or author with the given `__id_` field value (e.g. `/catalog/book/584493c1f4887f06c0e67d37)`.
* `catalog//create` — The form to create a new book, bookinstance, genre, or author (e.g. `/catalog/book/create)`.
* `catalog//__/update` — The form to update a specific book, bookinstance, genre, or author with the given `__id_` field value (e.g. `/catalog/book/584493c1f4887f06c0e67d37/update)`.
* `catalog//__/delete` — The form to delete a specific book, bookinstance, genre, author with the given `__id_` field value (e.g. `/catalog/book/584493c1f4887f06c0e67d37/delete)`.

The first home page and list pages don't encode any additional information. While the results returned will depend on the model type and the content in the database, the queries run to get the information will always be the same (similarly the code run for object creation will always be similar).

By contrast the other URLs are used to act on a specific document/model instance—these encode the identity of the item in the URL (shown as `__` above). We'll use path parameters to extract the encoded information and pass it to the route handler (and in a later article we'll use this to dynamically determine what information to get from the database). By encoding the information in our URL we only need one route for every resource of a particular type (e.g. one route to handle the display of every single book item).

Express allows you to construct your URLs any way you like — you can encode information in the body of the URL as shown above or use URL `GET` parameters (e.g. `/book/?id=6`). Whichever approach you use, the URLs should be kept clean, logical and readable.

Next we create our route handler callback functions and route code for all the above URLs.
