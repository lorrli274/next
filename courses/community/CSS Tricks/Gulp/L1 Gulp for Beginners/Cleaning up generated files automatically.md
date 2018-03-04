Since we're generating files automatically, we'll want to make sure that files that are no longer used don't remain anywhere without us knowing. 

This process is called "cleaning" (or in simpler terms, deleting files). 

We'll have to use [del](https://www.npmjs.com/package/del) to help us with cleaning. 
​    
```bash    
npm install del --save-dev
```

```javascript
var del = require('del');
```

The `del` function takes in an array of node globs which tells it what folders to delete. 

Setting it up with a gulp task is almost like the first "hello" example we had. 
​    
```javascript   
gulp.task('clean:dist', function() {
	return del.sync('dist');
})
```

Now gulp will delete the *dist* folder for you whenever `gulp clean:dist` is run. 

We don't have to worry about deleting the *dist/images* folder because gulp-cache has already stored the caches of the images on your local system. 

To clear the caches off your local system, you can create a separate task that's named `cache:clear`

```javascript
gulp.task('cache:clear', function (callback) {  
return cache.clearAll(callback)  
})
```

Let's combine all our tasks together now! 