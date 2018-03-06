There are many ODM/ORM solutions available on the NPM package manager site (check out the odm and orm tags for a subset!).

A few solutions that were popular at the time of writing are:

* [Mongoose](https://www.npmjs.com/package/mongoose): [Mongoose](https://www.mongodb.com/) is a MongoDB object modeling tool designed to work in an asynchronous environment.
* [Waterline](https://www.npmjs.com/package/waterline): An ORM extracted from the Express-based [Sails](https://sailsjs.com) web framework. It provides a uniform API for accessing numerous different databases, including Redis, mySQL, LDAP, MongoDB, and Postgres.
* [Bookshelf](https://www.npmjs.com/package/bookshelf): Features both promise-based and traditional callback interfaces, providing transaction support, eager/nested-eager relation loading, polymorphic associations, and support for one-to-one, one-to-many, and many-to-many relations. Works with PostgreSQL, MySQL, and SQLite3.
* [Objection](https://www.npmjs.com/package/objection): Makes it as easy as possible to use the full power of SQL and the underlying database engine (supports SQLite3, Postgres, and MySQL).
* [Sequelize](https://www.npmjs.com/package/sequelize): is a promise-based ORM for Node.js and io.js. It supports the dialects PostgreSQL, MySQL, MariaDB, SQLite and MSSQL and features solid transaction support, relations, read replication and more.

As a general rule you should consider both the features provided and the "community activity" (downloads, contributions, bug reports, quality of documentation, etc.) when selecting a solution. At time of writing Mongoose is by far the most popular ORM, and is a reasonable choice if you're using MongoDB for your database.
