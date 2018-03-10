The *index.js* file includes all **tasks**:  

```javascript
//index.js

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

To start developing you cannot just run `gulp` or `gulp build` since it will look for a *gulpfile.js* in the project root. We have to run the npm commands `npm run dev` and `npm run build` to make use of the defined flags.
