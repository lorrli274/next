Now a `BrowserSync` task setup:    

```javascript
//server.js

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

The **Dev Middleware** enables BrowserSync to process what was defined as entry in *webpack.js*. To give it this information we import the config module. **Hot Middlware**, on the other hand, checks for changes in app components like `.vue` files for Vue.js to inject.

Since we cannot hot reload files like *main.js*, we **watch** them and reload the window on change. Again, if you don't need HMR, remove *webpackHotMiddleware*.
