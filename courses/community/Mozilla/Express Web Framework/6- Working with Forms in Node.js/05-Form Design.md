Many of the models in the library are related/dependent. For example, a `Book` _requires_ an `Author`, and _may_ also have one or more `Genres`. This raises the question of how we should handle the case where a user wishes to:

* Create an object when its related objects do not yet exist (for example, a book where the author object hasn't been defined).
* Delete an object that is still being used by another object (so for example, deleting a `Genre` that is still being used by a `Book`).

For this project we will simplify the implementation by stating that a form can only:

* Create an object using objects that already exist (so users will have to create any required `Author` and `Genre` instances before attempting to create any `Book` objects).
* Delete an object if it is not referenced by other objects (so for example, you won't be able to delete a `Book` until all associated `BookInstance` objects have been deleted).

info> NOTE: A more "robust" implementation might allow you to create the dependent objects when creating a new object, and delete any object at any time (for example, by deleting dependent objects, or by removing references to the deleted object from the database).
