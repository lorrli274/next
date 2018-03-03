**Browsersync** helps make web development easier by spinning up a web server that helps us do live-reloading easily. It has other features, like synchronizing actions across multiple devices. 

We'll first have to install Browsersync: 
​    
```bash
$ npm install browser-sync --save-dev
```

You may have noticed that there isn't a `gulp-` prefix when we install Browsersync. This is because Browsersync works with gulp, so we don't have to use a plugin. 

To use Browser Sync, we'll have to `require` Browsersync.
​    
```javascript
var browserSync = require('browser-sync').create();
```

We need to create a `browserSync` task to enable gulp to spin up a server using Browsersync. Since we're running a server, we need to let Browsersync know where the root of the server should be. In our case, it's the `app` folder:
​    
```javascript
gulp.task('browserSync', function() {
	browserSync.init({
		server: {
			baseDir: 'app'
		},
	})
})
```

We also have to change our `sass` task slightly so Browsersync can inject new CSS styles (update the CSS) into the browser whenever the `sass` task is ran. 
​    
```javascript
gulp.task('sass', function() {
	return gulp.src('app/scss/**/*.scss') // Gets all files ending with .scss in app/scss
		.pipe(sass())
		.pipe(gulp.dest('app/css'))
		.pipe(browserSync.reload({
			stream: true
		}))
});
```

We're done with configuring Browsersync. Now, we have to run both the `watch` and `browserSync` tasks at the same time for live-reloading to occur. 

It'll be cumbersome to open up two command line windows and run `gulp browserSync` and `gulp watch` separately, so let's get gulp to run them together by telling the `watch` task that `browserSync` must be completed before `watch` is allowed to run. 

We can do so by adding a second argument to the `watch` task. The syntax is: 
​    
```javascript
gulp.task('watch', ['array', 'of', 'tasks', 'to', 'complete','before', 'watch'], function (){
	// ...
})
```

And in this case we're adding the browserSync task. 
​    
```javascript
gulp.task('watch', ['browserSync'], function (){
		gulp.watch('app/scss/**/*.scss', ['sass']); 
		// Other watchers
	})
```

We'll also want to make sure `sass` runs before `watch` so the CSS will already be the latest whenever we run a gulp command. 
​    
```javascript
gulp.task('watch', ['browserSync', 'sass'], function (){
	gulp.watch('app/scss/**/*.scss', ['sass']); 
	// Other watchers
});
```

Now, if you run `gulp watch` in the command line, Gulp should start both the `sass` and `browserSync` tasks concurrently. When both tasks are completed, `watch` will run. 

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Gulp/23.png)

At the same time, a browser window that points to `app/index.html` would also pop up. If you change the `styles.scss` file, you'll see that the browser reloads automatically. 

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Gulp/24.gif)

There's one more thing before we end this live-reloading section. Since we're already watching for `.scss` files to reload, why not go a step further and reload the browser if any HTML or JavaScript file gets saved? 

We can do so by adding two more watch processes, and calling the `browserSync.reload` function when a file gets saved: 
​    
```javascript
gulp.task('watch', ['browserSync', 'sass'], function (){
	gulp.watch('app/scss/**/*.scss', ['sass']); 
	// Reloads the browser whenever HTML or JS files change
	gulp.watch('app/*.html', browserSync.reload); 
	gulp.watch('app/js/**/*.js', browserSync.reload); 
});
```

So far in this course we've taken care of three things: 

1. Spinning up a web server for development
2. Using the Sass preprocessor
3. Reloading the browser whenever a file is saved

Let's cover the part on optimizing assets in the next step. We'll start with optimizing CSS and JavaScript files. 