Before you jump in and start coding the models, it's worth taking a few minutes to think about what data we need to store and the relationships between the different objects.

We know that we need to store information about books (title, summary, author, genre, ISBN) and that we might have multiple copies available (with globally unique ids, availability statuses, etc.). We might need to store more information about the author than just their name, and there might be multiple authors with the same or similar names. We want to be able to sort information based on book title, author, genre, and category.

When designing your models it makes sense to have separate models for every "object" (group of related information). In this case the obvious objects are books, book instances, and authors.

You might also want to use models to represent selection-list options (e.g. like a drop down list of choices), rather than hard coding the choices into the website itself — this is recommended when all the options aren't known up front or may change. The obvious candidate for a model of this type is the book genre (e.g. Science Fiction, French Poetry, etc.)

Once we've decided on our models and fields, we need to think about the relationships between them.

With that in mind, the UML association diagram below shows the models we'll define in this case (as boxes). As discussed above, we've created models for book (the generic details of the book), book instance (status of specific physical copies of the book available in the system), and author. We have also decided to have a model for genre, so that values can be created dynamically. We've decided not to have a model for the `BookInstance:status` — we will hard code the acceptable values because we don't expect these to change. Within each of the boxes you can see the model name, the field names and types, and also the methods and their return types.

The diagram also shows the relationships between the models, including their multiplicities. The multiplicities are the numbers on the diagram showing the numbers (maximum and minimum) of each model that may be present in the relationship. For example, the connecting line between the boxes shows that `Book` and a `Genre` are related. The numbers close to the `Book` model show that a book must have zero or more `Genre` (as many as you like), while the numbers on the other end of the line next to the `Genre` show that it can have zero or more associated books.

info> As discussed in our Mongoose primer below it is often better to have the field that defines the relationship between the documents/models in just one model (you can still find the reverse relationship by searching for the associated `_id` in the other model). Below we have chosen to define the relationship between Book/Genre and Book/Author in the Book schema, and the relationship between the Book/BookInstance in the BookInstance Schema. This choice was somewhat arbitrary — we could equally well have had the field in the other schema.

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Mozilla/Library%20Website%20-%20Mongoose_Express.png)
