Run the following to install necessary packages:

```Node.js
npm install babel-core
babel-preset-es2015
browser-sync
gulpjs/gulp#4.0
webpack
webpack-dev-middleware
webpack-hot-middleware -D
```

As of Node v7.9.0, ES6 modules are not supported, that is why we install Babel 6 to make use of import statements and other cutting edge JS features in our tasks.

If you don't need HMR, feel free to leave Hot Middleware out of the packages listed above. The Dev Middleware does not depend on it.
