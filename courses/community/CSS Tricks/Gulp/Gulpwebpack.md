[//]: # (content/Open Source/Gulpwebpack.MD)
## Combine Webpack with Gulp 4

**Webpack** is great when it comes to module bundling and working with frameworks like Vue or React, but it is a bit more awkward when handling static assets (like CSS). You might be more used to handling your static assets with something like Gulp 2, and there are some pretty good reasons for that. 

Still, the amount of JavaScript in our static projects is growing, so to compensate, let's make use of Webpack, while remaining in Gulp. In this course, specifically, Gulp 4. We'll use modern techniques to build an easily maintainable workflow, including the powerful and useful **Hot Module Reloading** (HMR).

## Install

Run the following to **install** necessary packages:
    
```js
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

## Starting Points

Create a `tasks` folder in your project root with three files: *Index.js*, *Webpack.js* and *Server.js*. We have less clutter in our project root since the index file acts like *Gulpfile.js* and the webpack file as *Webpack.config.js*.

The `site` folder holds all your site's assets:
    
```js
╔ site
║   ╚═══ main.js
╠ tasks
║   ╠═══ index.js
║   ╠═══ server.js
║   ╚═══ webpack.js
╚ package.json
```

To tell Gulp where the tasks are located, we need to add flags in our *Package.json*:
    
```js    
"scripts": {
  "dev": "gulp --require babel-register --gulpfile tasks",
  "build": "NODE_ENV=production gulp build --require babel-register --gulpfile tasks"
}
```

The `babel-register` command processes the import statements and the *\--gulpfile* flag defines the path to *Gulpfile.js* or, in our case, *Index.js* . We only need to reference the `tasks` folder because like in HTML the file named index marks the entry point.

## Set up a basic Webpack config

In *Webpack.js*:
    
```js    
import path from 'path'
import webpack from 'webpack'

let config = {
    entry: './main.js',
    output: {
        filename: './bundle.js',
        path: path.resolve(__dirname, '../site')
    },
    context: path.resolve(__dirname, '../site')
}

function scripts() {

    return new Promise(resolve => webpack(config, (err, stats) => {

        if (err) console.log('Webpack', err)

        console.log(stats.toString({ /* stats options */ }))

        resolve()
    }))
}
```

module.exports = { config, scripts }

Notice how we don't export the object directly like many tutorials show but put it into a variable first. This is necessary so we can use the configuration in the Gulp task `scripts` below as well as in the server middleware in the next step.

#### Context

The `config.context` setup is necessary to set all paths relative to our `site` folder. Otherwise they would start from the `tasks` folder which could lead to confusion down the road.

#### Separate Config and Task

If you have a very long Webpack **config**, you can also split it and the task into two files.
    
```js    
// webpack.js
export let config = { /* ... */ }


// scripts.js
import { config } from './webpack'
export function scripts() { /* ... */ }
```
## Hot Module Reloading

Here's how to make **HMR** work. Change the entry and plugins:
    
```js
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

Make sure to disable the extra entries and the HMR plugin for production. The package Webpack Merge helps setting up different environments for development and production.

## BrowserSync

Now a **BrowserSync** task setup:
    
```js    
import gulp from 'gulp'
import Browser from 'browser-sync'
import webpack from 'webpack'
import webpackDevMiddleware from 'webpack-dev-middleware'
import webpackHotMiddleware from 'webpack-hot-middleware'

import { config as webpackConfig } from './webpack'

const browser = Browser.create()
const bundler = webpack(webpackConfig)

export function server() {

    let config = {
        server: 'site',
        middleware: [
            webpackDevMiddleware(bundler, { /* options */ }),
            webpackHotMiddleware(bundler)
        ],
    }

    browser.init(config)

    gulp.watch('site/*.js').on('change', () => browser.reload())
}
```

The **Dev Middleware** enables BrowserSync to process what was defined as entry in *Webpack.js*. To give it this information we import the config module. Hot Middlware on the other hand checks for changes in app components like `.vue` files for Vue.js to inject.

Since we cannot hot reload files like *Main.js*, we watch them and reload the window on change. Again, if you don't need HMR, remove *webpackHotMiddleware.*

## Import all Tasks

The *Index.js* file includes all **tasks**:
    
```js    
import gulp from 'gulp'

import { scripts } from './webpack'
import { server }  from './server'

export const dev   = gulp.series( server )
export const build = gulp.series( scripts )

export default dev
```

The exported variables define what tasks to run under which command. The default export runs with `gulp`.

If you separate development and production environments for Webpack, you might want to run a `gulp build` task which makes use of production options. For that, we import the `scripts` tasks on its own since we don't need to start the server here.

During development, Webpack is run by BrowserSync so putting the scripts task in the dev command is not necessary.

#### Running Tasks

To start developing you cannot just run `gulp` or `gulp build` since it will look for a `gulpfile.js` in the project root. We have to run the npm commands `npm run dev` and `npm run build` to make use of the defined flags.

## Expanding

Now you can imagine how easy it is to **expand** and write more tasks. Export a task in one file and import it in `index.js`. Clean and easy to maintain!

To give you an idea of how to set up your project folder, here's an example setup:
    
```js    
╔ build
╠ src
╠ tasks
║   ╠═══ config.js => project wide
║   ╠═══ icons.js  => optimize/concat SVG
║   ╠═══ images.js => optimize images
║   ╠═══ index.js  => run tasks
║   ╠═══ misc.js   => copy, delete
║   ╠═══ server.js => start dev server
║   ╠═══ styles.js => CSS + preprocessor
║   ╚═══ webpack.js
╚ package.json
```

## Why use _both_ Webpack and Gulp?

#### Static File Handling

Gulp can handle **static assets** better than Webpack. The Copy Webpack can also copy files from your source to your build folder but when it comes to watching file deletion or changes like overriding an image, `gulp.watch` is a safer bet.

#### Server Environment

Webpack also comes with a local **server environment** via Webpack Dev Server, but using BrowserSync has some features you might not want to miss:

* CSS/HTML/image injection for non-app projects
* multiple device testing out of the box
* includes an admin panel for more control
* bandwidth throttling for speed and loading tests

#### Compilation Time

Sass gets **processed** by node-sass much quicker than by Webpack's combination of sass-loader, css-loader and extract-text-webpack-plugin.

#### Convenience

In Webpack, you have to import your CSS and SVG files for instance into JavaScript to process them which can be quite tricky and confusing sometimes. With Gulp, you don't need to adjust your workflow.
  
