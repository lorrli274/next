So far, we have created two distinct sets of gulp tasks: the first set is for a development process, where we compiled Sass to CSS, watched for changes, and reloaded the browser accordingly. 

The second set is for an optimization process, where we ready all files for the production website. We optimized assets like CSS, JavaScript, and images in this process and copied fonts over from `app` to `dist`. 

We've already grouped the first set of tasks together into a simple workflow with the `gulp watch` command: 
​    
```Javascript
gulp.task('watch', ['browserSync', 'sass'], function (){
	// ... watchers
})
```

The second set consists of tasks that we need to run to create the production website. This includes `clean:dist`, `sass`, `useref`, `images` and `fonts`. 

If we went by the same train of thought, we could create a `build` task to combine everything together. 
​    
```Javascript    
gulp.task('build', [`clean`, `sass`, `useref`, `images`, `fonts`], function (){
	console.log('Building files');
})
```

Unfortunately, we wouldn't be able to write the `build` task this way because gulp activates all tasks in the second argument simultaneously.

There's a possibility that `useref`, `images`, or even `fonts` gets completed before `clean` does, which means the entire `dist` folder gets deleted. 

So, to ensure that cleans get completed before the rest of the tasks, we need to use an extra plugin called [Run Sequence](https://www.npmjs.com/package/run-sequence).    

```bash
$ npm install run-sequence --save-dev
```

Here's the syntax of a task sequence with `run-sequence`: 
​    
```javascript    
var runSequence = require('run-sequence');

gulp.task('task-name', function(callback) {
	runSequence('task-one', 'task-two', 'task-three', callback);
});
```

When `task-name` is called, gulp will run `task-one` first. When `task-one` finishes, gulp will automatically start `task-two`. Finally, when `task-two` is complete, gulp will run `task-three`. 

`run-sequence` also allows you to run tasks simultaneously if you place them in an array: 
​    
```javascript
gulp.task('task-name', function(callback) {
	runSequence('task-one', ['tasks','two','run','in','parallel'], 'task-three', callback);
});
```

In this case, gulp first runs `task-one`. When `task-one` is completed, gulp runs every task in the second argument simultaneously. All tasks in this second argument must be completed before `task-three` is run.

So we can now create a task that ensures that `clean:dist` runs first, followed by all the other tasks:

```javascript
gulp.task('build', function (callback) {
	runSequence('clean:dist', 
		['sass', 'useref', 'images', 'fonts'],
		callback
	)
})
```

To make things consistent, we can also build the same sequence with the first group. Let's use `default` as the task name this time: 
​    
```javascript    
gulp.task('default', function (callback) {
	runSequence(['sass','browserSync', 'watch'],
		callback
	)
})
```

Why `default`? Because when you have a task named `default`, you can run it simply by typing the `gulp` command, which saves some keystrokes.

Finally, here's a [github repo](https://github.com/zellwk/gulp-starter-csstricks) for all the work we've done!