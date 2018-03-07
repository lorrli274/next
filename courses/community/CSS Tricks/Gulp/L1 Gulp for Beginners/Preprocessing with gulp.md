We can compile Sass to CSS in gulp with the help of a plugin called [gulp-sass](https://www.npmjs.com/package/gulp-sass). You can install gulp-sass into your project by using the `npm install` command like we did for `gulp`. 

We'd also want to use the `\--save-dev` flag to ensure that gulp-sass gets added to `devDependencies` in `package.json`. 
​    
```bash    
$ npm install gulp-sass --save-dev
```

We have to `require` gulp-sass from the `node_modules` folder just like we did with `gulp` before we can use the plugin. 
​    
```javascript    
var gulp = require('gulp');
// Requires the gulp-sass plugin
var sass = require('gulp-sass');
```

We can use gulp-sass by replacing `aGulpPlugin()` with `sass()`. Since the task is meant to compile Sass into CSS, let's name it `sass`. 
​    
```javascript    
gulp.task('sass', function(){
	return gulp.src('source-files')
		.pipe(sass()) // Using gulp-sass
		.pipe(gulp.dest('destination'))
});
```

We'll need to provide the `sass` task with source files and a destination for the task to work, so let's create a `styles.scss` file in the `app/scss` folder. This file will be added to the `sass` task in `gulp.src`. 

We want to output the eventual `styles.css` file to the `app/css` folder, which would be the `destination` for `gulp.dest`. 
​    
```javascript    
gulp.task('sass', function(){
	return gulp.src('app/scss/styles.scss')
		.pipe(sass()) // Converts Sass to CSS with gulp-sass
		.pipe(gulp.dest('app/css'))
});
```

We'll want to test that the `sass` task is working as we want it to. To do so, we can add a Sass function within `styles.scss`. 
​    
```scss    
// styles.scss
.testing {
	width: percentage(5/7);
}
```

If you run `gulp sass` in the command line, you should now be able to see that a `styles.css` file was created in `app/css`. In addition, it has the code where `percentage(5/7)` was evaluted into `71.42857%`. 
​    
```css    
/* styles.css */
.testing {
	width: 71.42857%; 
}
```

That's how we know that the `sass` task works! 

Sometimes we need the ability to compile more than one `.scss` file into CSS at the same. We can do so with the help of Node globs. 
