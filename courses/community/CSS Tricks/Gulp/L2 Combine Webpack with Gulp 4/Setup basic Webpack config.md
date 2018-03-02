In *Webpack.js*:
​    

```node.js    
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
​    
```node.js    
// webpack.js
export let config = { /* ... */ }


// scripts.js
import { config } from './webpack'
export function scripts() { /* ... */ }
```