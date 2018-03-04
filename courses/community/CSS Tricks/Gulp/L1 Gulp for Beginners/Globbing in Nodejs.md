Globs are matching patterns for files that allow you to add more than one file into *gulp.src*. It's like **regular expressions**, but specifically for file paths. 

When you use a glob, the computer checks file names and paths for the specified pattern. If the pattern exists, then a file is matched. 

Most workflows with gulp tend to only require 4 different globbing patterns: 

1. `*.scss`: The `*` pattern is a wildcard that matches any pattern in the current directory. In this case, we're matching any files ending with `.scss` in the root folder (`project`).
2. `**/*.scss`: This is a more extreme version of the `*` pattern that matches any file ending with `.scss` in the root folder and any child directories.
3. `!not-me.scss`: The `!` indicates that gulp should exclude the pattern from its matches, which is useful if you had to exclude a file from a matched pattern. In this case, `not-me.scss` would be excluded from the match.
4. `*.+(scss|sass)`: The plus `+` and parentheses `()` allows gulp to match multiple patterns, with different patterns separated by the pipe `|` character. In this case, gulp will match any file ending with `.scss` or `.sass` in the root folder.

Since we know about globbing now, we can replace `app/scss/styles.scss` with a `scss/**/*.scss` pattern, which matches any file with a `.scss` extension in `app/scss` or a child directory. 
​    
```javascript
    gulp.task('sass', function() {
      return gulp.src('app/scss/**/*.scss') // Gets all files ending with .scss in app/scss and children dirs
        .pipe(sass())
        .pipe(gulp.dest('app/css'))
    })
```

Any other Sass file that's found within `app/scss` would automatically be included into the `sass` task with this change. If you add a *print.scss*  file into the project, you'll see that `print.css` will be generated in `app/css`.

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Gulp/17.png)

We've now managed to compile all Sass files into CSS files with a single command. The question is, what good does it do if we have to run `gulp sass` manually every time we want to compile Sass into CSS? 

Luckily, we can tell gulp to automatically run the `sass` task whenever a file is saved through a process called "watching".