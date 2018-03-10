Create a `tasks` folder in your project root with three files: *index.js*, *webpack.js* and *server.js*. We have less clutter in our project root since the index file acts like *gulpfile.js* and the webpack file as *webpack.config.js*.

The `site` folder holds all your site's assets:

```
╔ site
║   ╚═══ main.js
╠ tasks
║   ╠═══ index.js
║   ╠═══ server.js
║   ╚═══ webpack.js
╚ package.json
```

To tell gulp where the tasks are located, we need to add flags in our *package.json*:
  
```javascript  
"scripts": {
  "dev": "gulp --require babel-register --gulpfile tasks",
  "build": "NODE_ENV=production gulp build --require babel-register --gulpfile tasks"
}
```

The `babel-register` command processes the import statements and the `--gulpfile` flag defines the path to *gulpfile.js* or, in our case, *index.js* . We only need to reference the `tasks` folder because, like in HTML, the file named index marks the entry point.
