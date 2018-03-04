The first step to using gulp is to `require` it in the gulpfile. 
​    

``` javascript
var gulp = require('gulp');
```

The require statement tells Node to look into the *node_modules* folder for a package named `gulp`. Once the package is found, we assign its contents to the variable `gulp`. 

We can now begin to write a gulp task with this `gulp` variable. The basic syntax of a gulp task is:
​    
```javascript
gulp.task('task-name', function() {
	// Stuff here
});
```

`task-name` refers to the name of the task, which would be used whenever you want to run a task in gulp. You can also run the same task in the command line by writing `gulp task-name`. 

To test it out, let's create a `hello` task that says `Hello Zell!`. 
​    
```javascript
gulp.task('hello', function() {
	console.log('Hello Zell');
});
```

We can run this task with `gulp hello` in the command line. 
​    
```bash
$ gulp hello
```

The command line will return a log that says `Hello Zell!`. 

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Gulp/14.png)

Gulp tasks are usually a bit more complex than this. It usually contains two additional gulp methods, plus a variety of gulp plugins. 

Here's what a real task may look like: 
​    
```javascript
gulp.task('task-name', function () {
	return gulp.src('source-files') // Get source files with gulp.src
		.pipe(aGulpPlugin()) // Sends it through a gulp plugin
		.pipe(gulp.dest('destination')) // Outputs the file in the destination folder
})
```

As you can see, a real task takes in two additional gulp methods — `gulp.src` and `gulp.dest`. 

`gulp.src` tells the gulp task what files to use for the task, while `gulp.dest` tells gulp where to output the files once the task is completed. 