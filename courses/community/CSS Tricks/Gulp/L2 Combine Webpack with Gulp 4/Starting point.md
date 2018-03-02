Create a `tasks` folder in your project root with three files: *Index.js*, *Webpack.js* and *Server.js*. We have less clutter in our project root since the index file acts like *Gulpfile.js* and the webpack file as *Webpack.config.js*.

The `site` folder holds all your site's assets:
​    
```node.js
╔ site
║   ╚═══ main.js
╠ tasks
║   ╠═══ index.js
║   ╠═══ server.js
║   ╚═══ webpack.js
╚ package.json
```

To tell Gulp where the tasks are located, we need to add flags in our *Package.json*:
​    
```node.js    
"scripts": {
  "dev": "gulp --require babel-register --gulpfile tasks",
  "build": "NODE_ENV=production gulp build --require babel-register --gulpfile tasks"
}
```

The `babel-register` command processes the import statements and the *\--gulpfile* flag defines the path to *Gulpfile.js* or, in our case, *Index.js* . We only need to reference the `tasks` folder because like in HTML the file named index marks the entry point.