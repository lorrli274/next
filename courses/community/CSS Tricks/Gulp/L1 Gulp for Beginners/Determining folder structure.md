Gulp is flexible enough to work with any folder structure. You'll just have to understand the inner workings before tweaking it for your project. 

For this course, we will use the structure of a generic webapp: 
​    
```
╔═ app/
║   ╠═══ css/
║   ╠═══ fonts/
║   ╠═══ images/ 
║   ╠═══ index.html
║   ╠═══ js/ 
║   ╚═══ scss/
╠═ dist/
╠═ gulpfile.js
╠═ node_modules/
╚═ package.json
```
In this structure, we'll use the `app` folder for development purposes, while the `dist` (as in "distribution") folder is used to contain optimized files for the production site. 

Since `app` is used for development purposes, all our code will be placed in `app`. 

We'll have to keep this folder structure in mind when we work on our gulp configurations. Now, let's begin by creating your first gulp task in `gulpfile.js`, which stores all gulp configurations. 
