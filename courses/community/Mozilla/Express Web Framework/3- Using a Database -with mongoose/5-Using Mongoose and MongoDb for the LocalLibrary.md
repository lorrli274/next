For the Local Library example (and the rest of this topic) we're going to use the [Mongoose ODM](https://www.npmjs.com/package/mongoose) to access our library data. Mongoose acts as a front end to [MongoDB](https://www.mongodb.com/what-is-mongodb), an open source [NoSQL](https://en.wikipedia.org/wiki/NoSQL) database that uses a document-oriented data model. A "collection" of "documents", in a MongoDB database, is [analogous](https://docs.mongodb.com/manual/core/databases-and-collections/#collections) to a "table" of "rows" in a relational database.

This ODM and database combination is extremely popular in the Node community, partially because the document storage and query system looks very like JSON, and is hence familiar to JavaScript developers.

info> You don't need to know MongoDB in order to use Mongoose, although parts of the Mongoose [documentation](http://mongoosejs.com/docs/guide.html) are easier to use and understand if you are already familiar with MongoDB.

The rest of this course shows how to define and access the Mongoose schema and models for the LocalLibrary website example.
