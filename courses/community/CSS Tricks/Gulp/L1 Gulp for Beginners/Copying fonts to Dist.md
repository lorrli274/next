Since font files are already optimized, there's nothing more we need to do. All we have to do is to copy the fonts into *dist*.

We can copy files with Gulp simply by specifying the gulp.src and gulp.dest without any plugins.

```javascript
gulp.task('fonts', function() {
  return gulp.src('app/fonts/**/*')
  .pipe(gulp.dest('dist/fonts'))
})
```

Now gulp will copy `fonts` from `app` to `dist` whenever you run gulp fonts.

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Gulp/font-copy.png)

We have 6 different tasks in the *gulpfile* now, and each of them has to be called individually with the command line, which is kinda cumbersome so we want to tie everything together into one command.

Before we do that though, let's look at how to clean up generated files automatically.