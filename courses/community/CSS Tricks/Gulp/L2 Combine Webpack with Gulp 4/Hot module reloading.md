Here's how to make **HMR** work. Change the entry and plugins:

```javascript
//webpack.js

entry: {
  main: [
    './main.js',
    'webpack/hot/dev-server',
    'webpack-hot-middleware/client'
  ]
},

/* ... */

plugins: [
  new webpack.HotModuleReplacementPlugin()
]
```

Make sure to disable the extra entries and the HMR plugin for production. The package [Webpack Merge](https://www.npmjs.com/package/webpack-merge) helps setting up different environments for development and production.
