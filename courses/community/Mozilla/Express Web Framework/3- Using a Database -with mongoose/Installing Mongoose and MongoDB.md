Mongoose is installed in your project (**Package.json**) like any other dependency — using NPM. To install it, use the following command inside your project folder:
    
```js    
npm install mongoose
```    

Installing _Mongoose_ adds all its dependencies, including the MongoDB database driver, but it does not install MongoDB itself. If you want to install a MongoDB server then you can download installers from here for various operating systems and install it locally. You can also use cloud-based MongoDB instances.

For this tutorial we'll be using the mLab cloud-based _database as a service_ sandbox tier to provide the database. This is suitable for development, and makes sense for the tutorial because it makes "installation" operating system independent (database-as-a-service is also one approach you might well use for your production database).
