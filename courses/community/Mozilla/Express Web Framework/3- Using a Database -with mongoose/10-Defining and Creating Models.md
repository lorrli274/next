**Models** are defined using the `**Schema**` interface. The Schema allows you to define the fields stored in each document along with their validation requirements and default values. In addition, you can define static and instance helper methods to make it easier to work with your data types, and also virtual properties that you can use like any other field, but which aren't actually stored in the database.

Schemas are then "compiled" into models using the `mongoose.model()` method. Once you have a model you can use it to find, create, update, and delete objects of the given type.

Each model maps to a _collection_ of _documents_ in the MongoDB database. The documents will contain the fields/schema types defined in the model `Schema`.
