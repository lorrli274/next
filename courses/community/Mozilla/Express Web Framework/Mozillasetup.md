## Express development environment overview

_Node_ and _Express_ make it very easy to set up your computer in order to start developing web applications. This section provides an overview of what tools are needed, explains some of the simplest methods for installing Node (and Express) on Ubuntu, macOS, and Windows, and shows how you can test your installation.

### What is the Express development environment?

The _Express_ development environment includes an installation of _Nodejs_, the _NPM package manager_, and (optionally) the _Express Application Generator_ on your local computer.

_Node_ and the _NPM_ package manager are installed together from preprepared binary packages, installers, operating system package managers or from source (as shown in the following sections). _Express_ is then installed by NPM as a dependency of your individual _Express_ web applications (along with other libraries like template engines, database drivers, authentication middleware, middleware to serve static files, etc.)

_NPM_ can also be used to (globally) install the _Express Application Generator_, a handy tool for creating skeleton _Express_ web apps that follow the [MVC pattern][1]. The application generator is optional because you don't _need_ to use this tool to create apps that use Express, or construct Express apps that have the same architectural layout or dependencies. We'll be using it though, because it makes getting started a lot easier, and promotes a modular application structure.

**Note:** Unlike for some other web frameworks, the development environment does not include a separate development web server. In _Node_/_Express_ a web application creates and runs its own web server!

There are other peripheral tools that are part of a typical development environment, including [text editors][2] or IDEs for editing code, and source control management tools like [Git][3] for safely managing different versions of your code. We are assuming that you've already got these sorts of tools installed (in particular a text editor).

### What operating systems are supported?

_Node_ can be run on Windows, macOS, many "flavours" of Linux, Docker, etc. (there is a full list on the nodejs [Downloads][4] page). Almost any personal computer should have the necessary performance to run Node during development. _Express_ is run in a _Node_ environment, and hence can run on any platform that runs _Node_.

In this article we provide setup instructions for Windows, macOS, and Ubuntu Linux.

### What version of Node/Express should you use?

There are many [releases of Node][5] — newer releases contain bug fixes, support for more recent versions of ECMAScript (JavaScript) standards, and improvements to the Node APIs. 

Generally you should use the most recent _LTS (long-term supported)_ release as this will be more stable than the "current" release while still having relatively recent features (and is still being actively maintained). You should use the _Current_ release if you need a feature that is not present in the LTS version.

For _Express_ you should always use the latest version.

### What about databases and other dependencies?

Other dependencies, such as database drivers, template engines, authentication engines, etc. are part of the application, and are imported into the application environment using the NPM package manager.  We'll discuss them in later app-specific articles.

## Installing Node

In order to use _Express_ you will first have to install _Nodejs_ and the [Node Package Manager (NPM)][6] on your operating system. The following sections explain the easiest way to install the Long Term Supported (LTS) version of Nodejs on Ubuntu Linux 16.04, macOS, and Windows 10.

**Tip:** The sections below show the easiest way to install _Node_ and _NPM_ on our target OS platforms. If you're using another OS or just want to see some of the other approaches for the current platforms then see [Installing Node.js via package manager][7] (nodejs.org).

### Windows and macOS

Installing _Node_ and _NPM_ on Windows and macOS is straightforward because you can just use the provided installer:

1. Download the required installer: 
    1. Go to 
    2. Select the button to download the LTS build that is "Recommended for most users".
2. Install Node by double-clicking on the downloaded file and following the installation prompts.

### Ubuntu 16.04

The easiest way to install the most recent LTS version of Node 6.x is to use the [package manager][8] to get it from the Ubuntu _binary distributions_ repository. This can be done very simply by running the following two commands on your terminal:
    
    
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    sudo apt-get install -y nodejs
    

**Warning:** Don't install directly from the normal Ubuntu repositories because they contain very old versions of node.

### Testing your Nodejs and NPM installation

The easiest way to test that node is installed is to run the "version" command in your terminal/command prompt and check that a version string is returned:
    
    
    >node -v
    v8.9.4

The _Nodejs_ package manager _NPM_ should also have been installed, and can be tested in the same way:
    
    
    >npm -v
    5.6.0

As a slightly more exciting test let's create a very basic "pure node" server that simply prints out "Hello World" in the browser when you visit the correct URL in your browser:

1. Copy the following text into a file named **hellonode.js**. This uses only _Node_ features (not Express): 
    
        //Load HTTP module
    var http = require("http");
    
    //Create HTTP server and listen on port 8000 for requests
    http.createServer(function (request, response) {
    
       // Set the response HTTP header with HTTP status and Content type
       response.writeHead(200, {'Content-Type': 'text/plain'});
       
       // Send the response body "Hello World"
       response.end('Hello Worldn');
    }).listen(8000);
    
    // Print URL for accessing server
    console.log('Server running at http://127.0.0.1:8000/')
    

The code imports the "http" module and uses it to create a server (`createServer()`) that listens for HTTP requests on port 8000. The script then prints a message to the console about what browser URL you can use to test the server. The `createServer()` function takes as an argument a callback function that will be invoked when an HTTP request is received — this simply returns a response with an HTTP status code of 200 ("OK") and the plain text "Hello World".

**Note:**  Don't worry if you don't understand exactly what this code is doing yet! We'll explain our code in greater detail once we start using Express!

2. Start the server by navigating into the same directory as your `hellonode.js` file in your command prompt, and calling `node` along with the script name, like so: 
    
        >node hellonode.js
    Server running at http://127.0.0.1:8000/
    

3. Navigate to the URL (). If everything is working, the browser should simply display the string "Hello World".

## Using NPM

Next to _Node_ itself, [NPM][6] is the most important tool for working with_ Node _applications. NPM is used to fetch any packages (JavaScript libraries) that an application needs for development, testing, and/or production, and may also be used to run tests and tools used in the development process. 

**Note:** From Node's perspective, _Express_ is just another package that you need to install using NPM and then require in your own code.

You can manually use NPM to separately fetch each needed package. Typically we instead manage dependencies using a plain-text definition file named [package.json][9]. This file lists all the dependencies for a specific JavaScript "package", including the package's name, version, description, initial file to execute, production dependencies, development dependencies, versions of _Node_ it can work with, etc. The **package.json** file should contain everything NPM needs to fetch and run your application (if you were writing a reusable library you could use this definition to upload your package to the npm respository and make it available for other users).

### Adding dependencies

The following steps show how you can use NPM to download a package, save it into the project dependencies, and then require it in a Node application.

**Note:** Here we show the instructions to fetch and install the _Express_ package. Later on we'll show how this package, and others, are already specified for us using the _Express Application Generator_. This section is provided because it is useful to understand how NPM works and what is being created by the application generator.

1. First create a directory for your new application and navigate into it: 
    
        mkdir myapp
    cd myapp

2. Use the npm `init` command to create a **package.json** file for your application. This command prompts you for a number of things, including the name and version of your application and the name of the initial entry point file (by default this is **index.js**). For now, just accept the defaults: 
    
        npm init

If you display the **package.json** file (`cat package.json`), you will see the defaults that you accepted, ending with the license.
    
        {
      "name": "myapp",
      "version": "1.0.0",
      "description": "",
      "main": "index.js",
      "scripts": {
        "test": "echo "Error: no test specified" && exit 1"
      },
      "author": "",
      "license": "ISC"
    }
    

3. Now install the _Express_ library in the **myapp** directory. The package will automatically be saved to the dependencies list in your **package.json** file. 
    
        npm install express

The dependencies section of your **package.json** will now appear at the end of the **package.json** file and will include _Express_.
    
        {
      "name": "myapp",
      "version": "1.0.0",
      "description": "",
      "main": "index.js",
      "scripts": {
        "test": "echo "Error: no test specified" && exit 1"
      },
      "author": "",
      "license": "ISC",
    **  "dependencies": {
        "express": "^4.16.2"
      }**
    }
    

4. To use the library you call the `require()` function as shown below. 
    
        **var express = require('express')**
    var app = express()
    
    app.get('/', function (req, res) {
      res.send('Hello World!')
    })
    
    app.listen(8000, function () {
      console.log('Example app listening on port 8000!')
    })
    

This code shows a minimal "HelloWorld" Express web application. This imports the "express" module and uses it to create a server (`app`) that listens for HTTP requests on port 8000 and prints a message to the console explaining what browser URL you can use to test the server. The `app.get()` function only responds to HTTP `GET` requests with the specified URL path ('/'), in this case by calling a function to send our _Hello World!_ message. 

Create a file named **index.js** in the root of the "myapp" application directory and give it the contents shown above.

5. You can start the server by calling node with the script in your command prompt: 
    
        >node index.js
    Example app listening on port 8000
    

6. Navigate to the URL (). If everything is working, the browser should simply display the string "Hello World!".

### Development dependencies

If a dependency is only used during development, you should instead save it as a "development dependency" (so that your package users don't have to install it in production). For example, to use the popular JavaScript Linting tool [eslint][10] you would call NPM as shown:
    
    
    npm install eslint --save-dev

The following entry would then be added to your application's **package.json**:
    
    
      "devDependencies": {
        "eslint": "^4.12.1"
      }
    

**Note:** "[Linters][11]" are tools that perform static analysis on software in order to recognise and report adherence/non-adherance to some set of coding best practice.

### Running tasks

In addition to defining and fetching dependencies you can also define _named_ scripts in your **package.json** files and call NPM to execute them with the [run-script][12] command. This approach is commonly used to automate running tests and parts of the development or build toolchain (e.g., running tools to minify JavaScript, shrink images, LINT/analyse your code, etc).

**Note:** Task runners like [Gulp][13] and [Grunt][14] can also be used to run tests and other external tools.

For example, to define a script to run the _eslint_ development dependency that we specified in the previous section we might add the following script block to our **package.json** file (assuming that our application source is in a folder /src/js):
    
    
    "scripts": {
      ...
      "lint": "eslint src/js"
      ...
    }
    

To explain a little further, `eslint src/js` is a command that we could enter in our terminal/command line to run `eslint` on JavaScript files contained in the `src/js` directory inside our app directory. Including the above inside our app's package.json file provides a shortcut for this command — `lint`.

We would then be able to run _eslint_ using NPM by calling:
    
    
    npm run-script lint
    # OR (using the alias)
    npm run lint
    

This example may not look any shorter than the original command, but you can include much bigger commands inside your npm scripts, including chains of multiple commands. You could identify a single npm script that runs all your tests at once.

## Installing the Express Application Generator

The [Express Application Generator][15] tool generates an Express application "skeleton". Install the generator using NPM as shown (the `-g` flag installs the tool globally so that you can call it from anywhere):
    
    
    npm install express-generator -g

To create an _Express_ app named "helloworld" with the default settings, navigate to where you want to create it and run the app as shown:
    
    
    express helloworld

**Note: **You can also specify the template library to use and a number of other settings. Use the `help` command to see all the options:
    
    
    express --help
    

NPM will create the new Express app in a sub folder of your current location, displaying build progress on the console. On completion, the tool will display the commands you need to enter to install the Node dependencies and start the app.

The new app will have a **package.json** file in its root directory. You can open this to see what dependencies are installed, including Express and the template library Jade:
    
    
    {
      "name": "helloworld",
      "version": "0.0.0",
      "private": true,
      "scripts": {
        "start": "node ./bin/www"
      },
      "dependencies": {
        "body-parser": "~1.18.2",
        "cookie-parser": "~1.4.3",
        "debug": "~2.6.9",
        "express": "~4.15.5",
        "jade": "~1.11.0",
        "morgan": "~1.9.0",
        "serve-favicon": "~2.4.5"
      }
    }

Install all the dependencies for the helloworld app using NPM as shown:
    
    
    cd helloworld
    npm install
    

Then run the app (the commands are slightly different for Windows and Linux/macOS), as shown below:
    
    
    # Run the helloworld on Windows
    SET DEBUG=helloworld:* & npm start
    
    # Run helloworld on Linux/macOS
    DEBUG=helloworld:* npm start
    

The DEBUG command creates useful logging, resulting in an output like that shown below.
    
    
    >SET DEBUG=helloworld:* & npm start
    
    > helloworld@0.0.0 start D:Githubexpresstestshelloworld
    > node ./bin/www
    
      helloworld:server Listening on port 3000 +0ms

Open a browser and navigate to  to see the default Express welcome page.

![Express - Generated App Default Screen][16]

We'll talk more about the generated app when we get to the article on generating a skeleton application.

## Summary

You now have a Node development environment up and running on your computer that can be used for creating Express web applications. You've also seen how NPM can be used to import Express into an application, and also how you can create applications using the Express Application Generator tool and then run them.

In the next article we start working through a tutorial to build a complete web application using this environment and associated tools.
  
