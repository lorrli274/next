For the _Local Library_ example (and the rest of this topic) we're going to use the Mongoose ODM to access our library data. Mongoose acts as a front end to MongoDB, an open source NoSQL database that uses a document-oriented data model. A "collection" of "documents", in a MongoDB database, is analogous to a "table" of "rows" in a relational database.

This ODM and database combination is extremely popular in the Node community, partially because the document storage and query system looks very like JSON, and is hence familiar to JavaScript developers.

You don't need to know MongoDB in order to use Mongoose, although parts of the Mongoose documentation _are_ easier to use and understand if you are already familiar with MongoDB.

The rest of this tutorial shows how to define and access the Mongoose schema and models for the LocalLibrary website example.
