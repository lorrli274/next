Gulp provides us with a `watch` method that checks to see if a file was saved. The syntax for the `watch` method is: 
​    

```javascript
// Gulp watch syntax
gulp.watch('files-to-watch', ['tasks', 'to', 'run']); 
```

If we want to watch all Sass files and run the `sass` task whenever a Sass file is saved, we just have to replace `files-to-watch` with the `app/scss/**/*.scss`, and [`'tasks', 'to', 'run']` with [`'sass']`: 
​    
```javascript
// Gulp watch syntax
gulp.watch('app/scss/**/*.scss', ['sass']); 
```

More often though, we'll want to watch more than one type of file at once. To do so, we can group together multiple watch processes into a `watch` task: 
​    
```javascript
gulp.task('watch', function(){
gulp.watch('app/scss/**/*.scss', ['sass']); 
// Other watchers
})
```

If you ran the `gulp watch` command right now, you'll see that gulp starts watching immediately. 

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Gulp/19.png)

And that it automatically runs the `sass` task whenever you save a `.scss` file. 

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Gulp/20.gif)

Let's take it a step further and make gulp reload the browser whenever we save a `.scss` file with the help of [Browser Sync](http://www.browsersync.io).
