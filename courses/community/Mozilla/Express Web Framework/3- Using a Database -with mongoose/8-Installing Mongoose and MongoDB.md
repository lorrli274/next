This section provides an overview of how to connect Mongoose to a MongoDB database, how to define a schema and a model, and how to make basic queries.

Mongoose is installed in your project (*Package.json*) like any other dependency — using NPM. To install it, use the following command inside your project folder:
    
```js    
npm install mongoose
```    

danger> Need to work on wording below. Needs to be edited to fit our use case (or just deleted)  

Installing Mongoose adds all its dependencies, including the MongoDB database driver, but it does not install MongoDB itself. If you want to install a MongoDB server then you can download installers from here for various operating systems and install it locally. You can also use cloud-based MongoDB instances.

For this coura we'll be using the mLab cloud-based database as a service sandbox tier to provide the database. This is suitable for development, and makes sense for the tutorial because it makes "installation" operating system independent (database-as-a-service is also one approach you might well use for your production database).
