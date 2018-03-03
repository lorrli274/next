First, we'll create a folder called *project* to serve as our project root as we move through this tutorial. Run the `npm init` command from inside that directory:
​    

``` 
# ... from within our project folder
$ npm init
```

The `npm init` command creates a *package.json* file for your project which stores information about the project, like the _dependencies_ used in the project (gulp is an example of a dependency).

`npm init` will prompt you: 

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Gulp/11.png)

Once the `package.json` file is created, we can install gulp into the project by using the following command: 
​    
```
$ npm install gulp --save-dev
```

This time, we're installing gulp into the project instead of installing it globally, which is why there are some differences in the command. 

You'll see that the `sudo` keyword isn't required because we're not installing gulp globally, so `-g` is also not necessary. We've added `\--save-dev`, which tells the computer to add `gulp` as a dev dependency in `package.json`.

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Gulp/12.png)

If you check the project folder when the command has finished executing, you should see that gulp has created a `node_modules` folder. You should also see a `gulp` folder within `node_modules`. 

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Gulp/13.png)

We're almost ready to start working with gulp. Before we do so, we have to be clear on how we're going to use gulp for the project, and part of that is deciding on a directory structure.