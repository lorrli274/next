Heroku runs websites within one or more "Dynos", which are isolated, virtualized Unix containers that provide the environment required to run an application. The dynos are completely isolated and have an **ephemeral file system** (a short-lived file system that is cleaned/emptied every time the dyno restarts). The only thing that dynos share by default are application configuration variables. Heroku internally uses a load balancer to distribute web traffic to all "web" dynos. Since nothing is shared between them, Heroku can scale an app horizontally by adding more dynos (though of course you may also need to scale your database to accept additional connections).

Because the file system is ephemeral you can't install services required by your application directly (e.g. databases, queues, caching systems, storage, email services, etc). Instead Heroku web applications use backing services provided as independent "add-ons" by Heroku or 3rd parties. Once attached to your web application, the add-on services are accessed in your web application via environment variables.

In order to execute your application Heroku needs to be able to set up the appropriate environment and dependencies, and also understand how it is launched. For Node apps all the information it needs is obtained from your _Package.json_ file.

Developers interact with Heroku using a special client app/terminal, which is much like a Unix bash script. This allows you to upload code that is stored in a git repository, inspect the running processes, see logs, set configuration variables, and much more!

In order to get our application to work on Heroku we'll need to put our Express web application into a git repository and make some minor changes to the package.json. Once we've done that we can set up a Heroku account, get the Heroku client, and use it to install our website.

That's all the overview you need in order to get started (see Getting Started on Heroku with Node.js for a more comprehensive guide).
