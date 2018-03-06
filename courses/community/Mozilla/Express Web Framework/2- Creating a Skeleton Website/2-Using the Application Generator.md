You should already have installed the **generator** as part of setting up a Node development environment. As a quick reminder, you install the generator tool site-wide using the NPM package manager, as shown:
    
```js    
npm install express-generator -g
```

The generator has a number of options, which you can view on the command line using the `\--help` (or `-h`) command:
    
```js    
> express --help

  Usage: express [options] [dir]

  Options:

    -h, --help           output usage information
        --version        output the version number
    -e, --ejs            add ejs engine support
        --pug            add pug engine support
        --hbs            add handlebars engine support
    -H, --hogan          add hogan.js engine support
    -v, --view   add view  support (ejs|hbs|hjs|jade|pug|twig|vash) (defaults to jade)
    -c, --css    add stylesheet  support (less|stylus|compass|sass) (defaults to plain css)
        --git            add .gitignore
    -f, --force          force on non-empty directory
```    

You can simply specify `express` to create a project inside the _Current_ directory using the Jade view engine and plain CSS (if you specify a directory name then the project will be created in a sub-folder with that name).
    
```js    
express
```

You can also choose a view (template) engine using `\--view` and/or a CSS generation engine using `\--css`.

info> The other options for choosing template engines (e.g. `\--hogan`, `\--ejs`, `\--hbs` etc.) are deprecated. Use `\--view` (or` -v`)!
