Run the following to install necessary packages:

```bash
npm install babel-core \
            babel-preset-es2015 \
            browser-sync \
            gulpjs/gulp#4.0 \
            webpack \
            webpack-dev-middleware \
            webpack-hot-middleware -D
```

As of Node v7.9.0, [ES6](https://developer.mozilla.org/de/docs/Web/JavaScript/Reference/Statements/import) [modules](https://developer.mozilla.org/de/docs/Web/JavaScript/Reference/Statements/import) are not supported, that is why we install [Babel](https://babeljs.io/) 6 to make use of import statements and other cutting edge JS features in our tasks.

If you don't need HMR, feel free to leave Hot Middleware out of the packages listed above. The Dev Middleware does not depend on it.
