[//]: # "content/Open Source/OpenTechSchool/Gulp"

We've gone through the absolute basics of Gulp and created a workflow that's able to compile Sass into CSS while watching HTML and JS files for changes at the same time. We can run this task with the `gulp` command in the command line. 

We've also built a second task, `build`, that creates a `dist` folder for the production website. We compiled Sass into CSS, optimized all our assets, and copied the necessary folders into the `dist` folder. To run this task, we just have to type `gulp build` into the command line. 

Lastly, we have a `clean` task that clears away from the generated `dist` folder any image caches that are created, allowing us to remove any old files that were inadvertently kept in `dist`. 

We've created a robust workflow so far that's capable enough for most web developers. Congratulations! 