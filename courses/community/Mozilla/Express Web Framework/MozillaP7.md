# Express Tutorial Part 7: Deploying to Production - Learn Web Development

Now you've created (and tested) an awesome LocalLibrary website, you're going to want to install it on a public web server so that it can be accessed by library staff and members over the Internet. This article provides an overview of how you might go about finding a host to deploy your website, and what you need to do in order to get your site ready for production.

## Overview

Once your site is finished (or finished "enough" to start public testing) you're going to need to host it somewhere more public and accessible than your personal development computer.

Up to now you've been working in a development environment, using Express/Node as a web server to share your site to the local browser/network, and running your website with (insecure) development settings that expose debugging and other private information. Before you can host a website externally you're first going to have to:

* Choose an environment for hosting the Express app.
* Make a few changes to your project settings.
* Set up a production-level infrastructure for serving your website.

This tutorial provides some guidance on your options for choosing a hosting site, a brief overview of what you need to do in order to get your Express app ready for production, and a worked example of how to install the LocalLibrary website onto the Heroku cloud hosting service.

Bear in mind that you don't have to use Heroku — there are other hosting service available.

## What is a Production Environment?

The production environment is the environment provided by the server computer where you will run your website for external consumption. The environment includes:

* Computer hardware on which the website runs.
* Operating system (e.g. Linux or Windows).
* Programming language runtime and framework libraries on top of which your website is written.
* Web server infrastructure, possibly incuding a web server, reverse proxy, load balancer, etc.
* Databases on which your website is dependent.

The server computer could be located on your premises and connected to the Internet by a fast link, but it is far more common to use a computer that is hosted "in the cloud". What this actually means is that your code is run on some remote computer (or possibly a "virtual" computer) in your hosting company's data center(s). The remote server will usually offer some guaranteed level of computing resources (e.g. CPU, RAM, storage memory, etc.) and Internet connectivity for a certain price.

This sort of remotely accessible computing/networking hardware is referred to as _Infrastructure as a Service (IaaS)_. Many IaaS vendors provide options to preinstall a particular operating system, onto which you must install the other components of your production environment. Other vendors allow you to select more fully-featured environments, perhaps including a complete Node setup.

Pre-built environments can make setting up your website very easy because they reduce the configuration, but the available options may limit you to an unfamiliar server (or other components) and may be based on an older version of the OS. Often it is better to install components yourself, so that you get the ones that you want, and when you need to upgrade parts of the system, you have some idea of where to start!

Other hosting providers support Express as part of a _Platform as a Service_ (_PaaS_) offering. When using this sort of hosting you don't need to worry about most of your production environment (servers, load balancers, etc.) as the host platform takes care of those for you. That makes deployment quite easy, because you just need to concentrate on your web application and not any other server infrastructure.

Some developers will choose the increased flexibility provided by IaaS over PaaS, while others will appreciate the reduced maintenance overhead and easier scaling of PaaS. When you're getting started, setting up your website on a PaaS system is much easier, so that is what we'll do in this tutorial.

If you choose a Node/Express-friendly hosting provider they should provide instructions on how to set up an Express website using different configurations of webserver, application server, reverse proxy, etc. For example, there are many step-by-step guides for various configurations in the Digital Ocean Node community docs.

## Choosing a Hosting Provider

There are numerous hosting providers that are known to either actively support or work well with _Node_ (and _Express_). These vendors provide different types of environments (IaaS, PaaS), and different levels of computing and network resources at different prices.

There are a lot of hosting solutions, and their services and pricing can change over time. While we introduce a few options below, it is worth performing your own Internet search before selecting a hosting provider.

Some of the things to consider when choosing a host:

* How busy your site is likely to be and the cost of data and computing resources required to meet that demand.
* Level of support for scaling horizontally (adding more machines) and vertically (upgrading to more powerful machines) and the costs of doing so.
* Where the supplier has data centres, and hence where access is likely to be fastest.
* The host's historical uptime and downtime performance.
* Tools provided for managing the site — are they easy to use and are they secure (e.g. SFTP vs FTP).
* Inbuilt frameworks for monitoring your server.
* Known limitations. Some hosts will deliberately block certain services (e.g. email). Others offer only a certain number of hours of "live time" in some price tiers, or only offer a small amount of storage.
* Additional benefits. Some providers will offer free domain names and support for SSL certificates that you would otherwise have to pay for.
* Whether the "free" tier you're relying on expires over time, and whether the cost of migrating to a more expensive tier means you would have been better off using some other service in the first place!

The good news when you're starting out is that there are quite a few sites that provide computing environments for "free", albeit with some conditions. For example, Heroku provides a free but resource-limited _PaaS_ environment "forever", while Amazon Web Services, Microsoft Azure, and the open source option PWS/Cloud Foundry provide free credit when you first join.

Many providers also have a "basic" tier that provides more useful levels of computing power and fewer limitations. Digital Ocean is an example of a popular hosting provider that offers a relatively inexpensive basic computing tier (in the $5 per month lower range at time of writing).

Remember that price is not the only selection criterion. If your website is successful, it may turn out that scalability is the most important consideration.

## Getting Your Website Ready to Publish

The main things to think about when publishing your website are web security and performance. Minimally you will want to remove the stack traces that are included on error pages during development, tidy up your logging, and set the appropriate headers to avoid many common security threats.

In the following subsections we outline the most important changes that you should make to your app.

### Set NODE_ENV to 'production'

We can remove stack traces in error pages by setting the `NODE_ENV` environment variable to _production_ (it is set to '_development_' by default). In addition to generating less-verbose error messages, setting the variable to _production_ caches view templates and CSS files generated from CSS extensions. Tests indicate that setting `NODE_ENV` to _production_ can improve app performance by a factor of three!

This change can be made either by using export or an environment file, or using the OS initialisation system.  

This is actually a change you make in your environment setup rather than your app, but important enough to note here! We'll show how this is set for our hosting example below. 

### Log Appropriately

Logging calls can have an impact on a high-traffic website. In a production environment you may need to log website activity (e.g. tracking traffic or logging API calls) but you should attempt to minimise the amount of logging added for debugging purposes.

One way to minimise "debug" logging in production is to use a module like [debug ][9]that allows you to control what logging is performed by setting an environment variable. For example, the code fragment below shows how you might  set up "author" logging. The debug variable is declared with the name 'author', and the prefix "author" will be automatically displayed for all logs from this object.
    
```js    
**var debug = require('debug')('author');**

// Display Author update form on GET
exports.author_update_get = function(req, res, next) {   

    req.sanitize('id').escape().trim();
    Author.findById(req.params.id, function(err, author) {
        if (err) {
**            debug('update error:' + err);**
            return next(err);
        }
        //On success
        res.render('author_form', { title: 'Update Author', author: author });
    });

};
```

You can then enable a particular set of logs by specifying them as a comma-separated list in the `DEBUG` environment variable. You can set the variables for displaying author and book logs as shown (wildcards are also supported).
    
```    
#Windows
set DEBUG=author,book

#Linux
export DEBUG="author,book" 
```    

Calls to `debug` can replace logging you might previously have done using `console.log()` or `console.error()`. Replace any `console.log()` calls in your code with logging via the debug module. Turn the logging on and off in your development environment by setting the DEBUG variable and observe the impact this has on logging.

If you need to log website activity you can use a logging library like _Winston_ or _Bunyan_.

### Use gzip-deflate Compression for Responses

Web servers can often compress the HTTP response sent back to a client, significantly reducing the time taken to for the client to get and load the page. The compression method used will depend on what decompression methods the client says that it supports in the request (if no compression methods are supported the response will be sent uncompressed).

You can add this to your site using compression middleware. Install this to your project by running the following command at the root of the project.
    
```js    
npm install compression --save
```

Open **./App.js** and require the compression library as shown. Add the compression library to the middleware chain with the `use()` method (this should appear before any routes that you want compressed — in this case all of them!)
    
```js    
var catalog = require('./routes/catalog'); //Import routes for "catalog" area of site
**var compression = require('compression');**

// Create the Express application object
var app = express();

...

**app.use(compression()); //Compress all routes**

app.use(express.static(path.join(__dirname, 'public')));

app.use('/', index);
app.use('/users', users);
app.use('/catalog', catalog);  // Add catalog routes to middleware chain.

...
```    

For a high-traffic website in production you wouldn't use this middleware. Instead you would use a reverse proxy like _Nginx_.

### Use Helmet to Protect Against Well Known Vulnerabilities

Helmet is a middleware package that can help protect your app from some well-known web vulnerabilities by setting appropriate HTTP headers.

Install this to your project by running the following command at the root of the project.
    
```js    
npm install helmet --save
```    

Open **./App.js** and require the _helmet_ library as shown. Then add the module to the middleware chain with the `use()` method.
    
```js    
var compression = require('compression');
**var helmet = require('helmet');
**
// Create the Express application object
var app = express();

**app.use(helmet())**;
...
```

The command above adds the _subset_ of available headers that makes sense for most sites. You can add/disable specific headers as needed by following the instructions on npm.

## Example: Installing LocalLibrary on Heroku

This section provides a practical demonstration of how to install _LocalLibrary_ on the Heroku PaaS cloud.

### Why Heroku?

Heroku is one of the longest running and popular cloud-based PaaS services. It originally supported only Ruby apps, but now can be used to host apps from many programming environments, including Node (and hence Express)!

We are choosing to use Heroku for several reasons:

* Heroku has a free tier that is _really_ free (albeit with some limitations).
* As a PaaS, Heroku takes care of a lot of the web infrastructure for us. This makes it much easier to get started, because you don't worry about servers, load balancers, reverse proxies, restarting your website on a crash, or any of the other web infrastructure that Heroku provides for us under the hood.
* While it does have some limitations, these will not affect this particular application. For example: 
    * Heroku provides only short-lived storage so user-uploaded files cannot safely be stored on Heroku itself.
    * The free tier will sleep an inactive web app if there are no requests within a half hour period. The site may then take several seconds to respond when it is woken up.
    * The free tier limits the time that your site is running to a certain amount of hours every month (not including the time that the site is "asleep"). This is fine for a low use/demonstration site, but will not be suitable if 100% uptime is required.
    * Other limitations are listed in Limits (Heroku docs).
* Mostly it just works, and if you end up loving it and want to upgrade, scaling your app is very easy.

While Heroku is perfect for hosting this demonstration it may not be perfect for your real website. Heroku makes things easy to set up and scale, at the cost of being less flexible, and potentially a lot more expensive once you get out of the free tier.

### How Does Heroku Work?

Heroku runs websites within one or more "Dynos", which are isolated, virtualized Unix containers that provide the environment required to run an application. The dynos are completely isolated and have an _ephemeral_ file system (a short-lived file system that is cleaned/emptied every time the dyno restarts). The only thing that dynos share by default are application configuration variables. Heroku internally uses a load balancer to distribute web traffic to all "web" dynos. Since nothing is shared between them, Heroku can scale an app horizontally by adding more dynos (though of course you may also need to scale your database to accept additional connections).

Because the file system is ephemeral you can't install services required by your application directly (e.g. databases, queues, caching systems, storage, email services, etc). Instead Heroku web applications use backing services provided as independent "add-ons" by Heroku or 3rd parties. Once attached to your web application, the add-on services are accessed in your web application via environment variables.

In order to execute your application Heroku needs to be able to set up the appropriate environment and dependencies, and also understand how it is launched. For Node apps all the information it needs is obtained from your **Package.json** file.

Developers interact with Heroku using a special client app/terminal, which is much like a Unix bash script. This allows you to upload code that is stored in a git repository, inspect the running processes, see logs, set configuration variables, and much more!

In order to get our application to work on Heroku we'll need to put our Express web application into a git repository and make some minor changes to the package.json. Once we've done that we can set up a Heroku account, get the Heroku client, and use it to install our website.

That's all the overview you need in order to get started (see Getting Started on Heroku with Node.js for a more comprehensive guide).

### Creating an Application Repository in Github

Heroku is closely integrated with the **git** source code version control system, using it to upload/synchronise any changes you make to the live system. It does this by adding a new Heroku "remote" repository named _heroku_ pointing to a repository for your source on the Heroku cloud. During development you use git to store changes on your "master" repository. When you want to deploy your site, you sync your changes to the Heroku repository.

If you're used to following good software development practices you are probably already using git or some other SCM system. If you already have a git repository, then you can skip this step.

There are a lot of ways of to work with git, but one of the easiest is to first set up an account on GitHub, create the repository there, and then sync to it locally:

1. Visit  and create an account.
2. Once you are logged in, click the **+** link in the top toolbar and select **New repository**.
3. Fill in all the fields on this form. While these are not compulsory, they are strongly recommended. 
    * Enter a new repository name (e.g. _express-locallibrary-tutorial_), and description (e.g. "Local Library website written in Express (Node)".
    * Choose **Node** in the _Add .gitignore_ selection list.
    * Choose your preferred license in the _Add license_ selection list.
    * Check **Initialize this repository with a README**.
4. Press **Create repository**.
5. Click the green "**Clone or download**" button on your new repo page.
6. Copy the URL value from the text field inside the dialog box that appears (it should be something like: **https://github.com/__/express-locallibrary-tutorial.git**).

Now the repository ("repo") is created we are going to want to clone it on our local computer:

1. Install _git_ for your local computer (you can find versions for different platforms here).
2. Open a command prompt/terminal and clone your repository using the URL you copied above: 

```js
git clone https://github.com/**__**/express-locallibrary-tutorial.git
 ```   

This will create the repository below the current point.
3. Navigate into the new repo. 
 
```js
cd express-locallibrary-tutorial
```

The final step is to copy in your application and then add the files to your repo using git:

1. Copy your Express application into this folder (excluding **/node_modules**, which contains dependency files that you should fetch from NPM as needed).
2. Open a command prompt/terminal and use the `add` command to add all files to git.

```js
3.     git add -A
```    

4. Use the status command to check all files that you are about to add are correct (you want to include source files, not binaries, temporary files etc.). It should look a bit like the listing below. 

```js
    > git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD ..." to unstage)

        new file:   ...
```

5. When you're satisfied commit the files to your local repository: 

```js
git commit -m "First version of application moved into github"
```

6. Then synchronise your local repository to the Github website, using the following: 

```js
git push origin master
```

When this operation completes, you should be able to go back to the page on Github where you created your repo, refresh the page, and see that your whole application has now been uploaded. You can continue to update your repository as files change using this add/commit/push cycle.

This is a good point to make a backup of your "vanilla" project — while some of the changes we're going to be making in the following sections might be useful for deployment on any platform (or development) others might not.

The _best_ way to do this is to use _git_ to manage your revisions. With _git_ you can not only go back to a particular old version, but you can maintain this in a separate "branch" from your production changes and cherry-pick any changes to move between production and development branches. Learning Git is well worth the effort, but is beyond the scope of this topic.

The _easiest_ way to do this is to just copy your files into another location. Use whichever approach best matches your knowledge of git!

### Update the App for Heroku

This section explains the changes you'll need to make to our _LocalLibrary_ application to get it to work on Heroku.

#### Set Node Version 

The **Package.json** contains everything needed to work out your application dependencies and what file should be launched to start your site. Heroku detects the presence of this file, and will use it to provision your app environment.

The only useful information missing in our current **Package.json** is the version of node. We can find the version of node we're using for development by entering the command:
    
```js    
>node --version
v8.9.1
```

Open **Package.json**, and add this information as an **engines > node** section as shown (using the version number for your system).
    
```js    
{
  "name": "express-locallibrary-tutorial",
  "version": "0.0.0",
**  "engines": {
    "node": "8.9.1"
  },**
  "private": true,
  ...
```    

#### Database Configuration

So far in this tutorial we've used a single database that is hard coded into **App.js**. Normally we'd like to be able to have a different database for production and development, so next we'll modify the LocalLibrary website to get the database URI from the OS environment (if it has been defined), and otherwise use our development database.

Open **App.js** and find the line that sets the mongoDB connection variable. It will look something like this:
    
```js    
var mongoDB = 'mongodb://your_user_id:your_password@ds119748.mlab.com:19748/local_library';
```

Replace the line with the following code that uses `process.env.MONGODB_URI` to get the connection string from an environment variable named `MONGODB_URI` if has been set (use your own database URL instead of the placeholder below.)
    
```js    
var mongoDB = **process.env.MONGODB_URI** || 'mongodb://your_user_id:your_password@ds119748.mlab.com:19748/local_library';
```    

#### Get Dependencies and Re-Test

Before we proceed, let's test the site again and make sure it wasn't affected by any of our changes. 

First we will need to fetch our dependencies (you will recall we didn't copy the **node_modules** folder into our git tree). You can do this by running the following command in your terminal at the root of the project:
    
```js    
npm install
```    

Now run the site (see Testing the routes for the relevant commands) and check that the site still behaves as you expect.

#### Save Changes to Github

Next let's save all our changes to Github. In the terminal (whilst inside our repository), enter the following commands:
    
```js    
git add -A
git commit -m "Added files and changes required for deployment to heroku"
git push origin master
```

We should now be ready to start deploying _LocalLibrary_ on Heroku.

### Get a Heroku Account

To start using Heroku you will first need to create an account (skip ahead to Create and upload the website if you've already got an account and installed the Heroku client):

* Go to www.heroku.com and click the **SIGN UP FOR FREE** button.
* Enter your details and then press **CREATE FREE ACCOUNT**. You'll be asked to check your account for a sign-up email.
* Click the account activation link in the signup email. You'll be taken back to your account on the web browser.
* Enter your password and click **SET PASSWORD AND LOGIN**.
* You'll then be logged in and taken to the Heroku dashboard: .

### Install the Client

Download and install the Heroku client by following the instructions on Heroku here.

After the client is installed you will be able run commands. For example to get help on the client:
    
```js    
heroku help
```    

### Create and Upload the Website

To create the app we run the "create" command in the root directory of our repository. This creates a git remote ("pointer to a remote repository") named _heroku_ in our local git environment.
    
```js    
heroku create
```

You can name the remote if you like by specifying a value after "create". If you don't then you'll get a random name. The name is used in the default URL.

We can then push our app to the Heroku repository as shown below. This will upload the app, get all its dependencies, package it in a dyno, and start the site.
    
```js    
git push heroku master
```

If we're lucky, the app is now "running" on the site. To open your browser and run the new website, use the command:
    
```js    
heroku open
```

The site will be running using our development database. Create some books and other objects, and check out whether the site is behaving as you expect. In the next section we'll set it to use our new database.

### Setting Configuration Variables

You will recall from a preceding section that we need to set NODE_ENV to 'production' in order to improve our performance and generate less-verbose error messages. We do this by entering the following command:
    
```js    
>heroku config:set NODE_ENV='production'
Setting NODE_ENV and restarting limitless-tor-18923... done, v13
NODE_ENV: production
 ```   

We should also use a separate database for production, setting its URI in the **MONGODB_URI**  environment variable. You can set up a new database and database-user exactly as we did originally, and get its URI. You can set the URI as shown (obviously, using your own URI!)
    
```js    
>heroku config:set **MONGODB_URI**='mongodb://your_user:your_password@ds139278.mlab.com:39278/local_library_production'
Setting MONGODB_URI and restarting limitless-tor-18923... done, v13
MONGODB_URI: mongodb://your_user:your_password@ds139278.mlab.com:39278/local_library_production
 ```   

You can inspect your configuration variables at any time using the `heroku config` command — try this now:
    
```js    
>heroku config
=== limitless-tor-18923 Config Vars
MONGODB_URI: mongodb://your_user:your_password@ds139278.mlab.com:39278/local_library_production
NODE_ENV:    production
```    

Heroku will restart your app when it updates the variables. If you check the home page now it should show zero values for your object counts, as the changes above mean that we're now using a new (empty) database.

### Managing Addons

Heroku uses independent add-ons to provide backing services to apps — for example email or database services. We don't use any addons in this website, but they are an important part of working with Heroku, so you may want to check out the topic Managing Add-ons (Heroku docs).

### Debugging

The Heroku client provides a few tools for debugging:
    
```js    
heroku logs  # Show current logs
heroku logs --tail # Show current logs and keep updating with any new results
heroku ps   #Display dyno status
```    

## Summary

That's the end of this tutorial on setting up Express apps in production, and also the series of tutorials on working with Express. We hope you've found them useful. 

  
