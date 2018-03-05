We can remove stack traces in error pages by setting the `NODE_ENV` environment variable to production (it is set to 'development' by default). In addition to generating less-verbose error messages, setting the variable to _production_ caches view templates and CSS files generated from CSS extensions. Tests indicate that setting `NODE_ENV` to _production_ can improve app performance by a factor of three!

This change can be made either by using export or an environment file, or using the OS initialisation system.  

Info>This is actually a change you make in your environment setup rather than your app, but important enough to note here! We'll show how this is set for our hosting example below. 
