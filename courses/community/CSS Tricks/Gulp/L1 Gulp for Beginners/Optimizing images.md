You've probably guessed it by now; we need to use `gulp-imagemin` to help us with optimizing images.
​    

```bash    
$ npm install gulp-imagemin --save-dev
```

```javascript
var imagemin = require('gulp-imagemin');
```

We can minify `png`, `jpg`, `gif` and even `svg` with the help of `gulp-imagemin`. Let's create an `images` task for this optimization process. 
​    
```javascript    
gulp.task('images', function(){
	return gulp.src('app/images/**/*.+(png|jpg|gif|svg)')
	.pipe(imagemin())
	.pipe(gulp.dest('dist/images'))
});
```

Since different file types can be optimized differently, you might want to add options to `imagemin` to customize how each file is optimized. 

For example, you can create interlaced GIFs by setting the `interlaced` option key to `true`. 
​    
```javascript    
gulp.task('images', function(){
	return gulp.src('app/images/**/*.+(png|jpg|jpeg|gif|svg)')
	.pipe(imagemin({
			// Setting interlaced to true
			interlaced: true
		}))
	.pipe(gulp.dest('dist/images'))
});
```

You can play around with other options if you want to as well. 

Optimizing images however, is an extremely slow process that you'd not want to repeat unless necessary. To do so, we can use the [gulp-cache](https://www.npmjs.com/package/gulp-cache)  plugin.
​    
```bash    
$ npm install gulp-cache --save-dev
```

```javascript
var cache = require('gulp-cache');

gulp.task('images', function(){
	return gulp.src('app/images/**/*.+(png|jpg|jpeg|gif|svg)')
	// Caching images that ran through imagemin
	.pipe(cache(imagemin({
			interlaced: true
		})))
	.pipe(gulp.dest('dist/images'))
});
```

We're almost done with the optimization process. There's one more folder that we need to transfer from the `app` directory into `dist`, the fonts directory.