Developers have two tasks to perform when they try to optimize CSS and JavaScript files for production: **minification** and **concatenation**. 

One problem developers face when automating this process is that it's difficult to concatenate your scripts in the correct order. 

Say we have included 3 script tags in `index.html`.

```html
http://www.google-analytics.com/ga.js"> src="">https://css-tricks.com/js/lib/a-library.js">
">https://css-tricks.com/js/lib/another-library.js">
">https://css-tricks.com/js/main.js">
```

These scripts are located in two different directories. It'll be difficult to concatenate them with traditional plugins like gulp-concatenate. 

Thankfully, there's a useful gulp plugin, `gulp-useref` that solves this problem. 

`gulp-useref` concatenates any number of CSS and JavaScript files into a single file by looking for a comment that starts with "". Its syntax is: 
​    
```html   
... HTML Markup, list of script / link tags.
```

`` can either be `js`, `css`, or `remove`. It's best to set `type` to the type of file that you're trying to concatenate. If you set `type` to `remove`, Gulp will remove the entire build block without generating a file. 

`` here refers to the target path of the generated file.

We'll want the final JavaScript file to be generated in the `js` folder, as *main.min.js*. Hence, the markup would be: 

```html
">https://css-tricks.com/js/lib/a-library.js">
">https://css-tricks.com/js/lib/another-library.js">
">https://css-tricks.com/js/main.js">
```

Now let's configure the `gulp-useref` plugin in the *gulpfile*. We'll have to install the plugin and require it in the *gulpfile*.
​    
```bash 
$ npm install gulp-useref --save-dev
```

```javascript
var useref = require('gulp-useref');
```

Setting up the `useref` task is similar to the other tasks we've done so far. Here's the code: 
​    
```javascript    
gulp.task('useref', function(){
	return gulp.src('app/*.html')
		.pipe(useref())
		.pipe(gulp.dest('dist'))
});
```

Now if you run this `useref` task, gulp will take run through the 3 script tags and concatenate them into `dist/js/main.min.js`. 

>Dev: Add image: https://cdn.css-tricks.com/wp-content/uploads/2015/08/main-min.png

The file however, isn't minified right now. We'll have to use the [gulp-uglify][https://www.npmjs.com/package/gulp-uglify] plugin to help with minifying JavaScript files. We also need a second plugin called [gulp-if][https://github.com/robrich/gulp-if] to ensure that we only attempt to minify JavaScript files. 
​    
```bash    
$ npm install gulp-uglify --save-dev 
```

```javascript
// Other requires...
var uglify = require('gulp-uglify');
var gulpIf = require('gulp-if');

gulp.task('useref', function(){
	return gulp.src('app/*.html')
		.pipe(useref())
		// Minifies only if it's a JavaScript file
		.pipe(gulpIf('*.js', uglify()))
		.pipe(gulp.dest('dist'))
});
```

Gulp should now automatically minify the `main.min.js` file whenever you run the `useref` task. 

One neat thing I've yet to reveal with `gulp-useref` is that it automatically changes all the scripts within "" into one single JavaScript file that points to `js/main.min.js`. 

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Gulp/25.png)

Wonderful, isn't it? 

We can use the same method to concatenate any CSS files (if you decided to add more than one) as well. We'll follow the same process and add a `build` comment. 
​    
```HTML
">https://css-tricks.com/css/styles.css">
">https://css-tricks.com/css/another-stylesheet.css">
```

We can also minify the concatenated CSS file as well. We need to use a package called [gulp-cssnano][31] plugin to help us with minification.
​    
```bash    
$ npm install gulp-cssnano
```

```javascript
var cssnano = require('gulp-cssnano');

gulp.task('useref', function(){
	return gulp.src('app/*.html')
		.pipe(useref())
		.pipe(gulpIf('*.js', uglify()))
		// Minifies only if it's a CSS file
		.pipe(gulpIf('*.css', cssnano()))
		.pipe(gulp.dest('dist'))
});
```

Now you'd get one optimized CSS file and one optimized JavaScript file whenever you run the `useref` task. 

Let's move on and optimize images next. 