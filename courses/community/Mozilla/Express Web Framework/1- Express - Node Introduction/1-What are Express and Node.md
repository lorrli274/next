danger> _Node.js_ should be **Node.js** because it is a term.

**Node** (or more formally _Node.js_) is an open-source, cross-platform, runtime environment that allows developers to create all kinds of server-side tools and applications in JavaScript. The runtime is intended for use outside of a browser context (i.e. running directly on a computer or server OS). As such, the environment omits browser-specific JavaScript APIs and adds support for more traditional OS APIs including HTTP and file system libraries.

From a web server development perspective Node has a number of benefits:

* Great performance! Node has been designed to optimize throughput and scalability in web applications and is a very good match for many common web-development problems (e.g. real-time web applications).
* Code is written in "plain old JavaScript", which means that less time is spent dealing with "context shift" between languages when you're writing both browser and web server code.
* JavaScript is a relatively new programming language and benefits from improvements in language design when compared to other traditional web-server languages (e.g. Python, PHP, etc.) Many other new and popular languages compile/convert into JavaScript so you can also use CoffeeScript, ClosureScript, Scala, LiveScript, etc.
* The node package manager (NPM) provides access to hundreds of thousands of reusable packages. It also has best-in-class dependency resolution and can also be used to automate most of the build toolchain.
* It is portable, with versions running on Microsoft Windows, OS X, Linux, Solaris, FreeBSD, OpenBSD, WebOS, and NonStop OS. Furthermore, it is well-supported by many web hosting providers, that often provide specific infrastructure and documentation for hosting Node sites.
* It has a very active third party ecosystem and developer community, with lots of people who are willing to help.

danger> `localhost:5000` should be a link and the template should be the reference, not what you see.

You can trivially create a simple web server to respond to any request using just the Node HTTP package, as shown below. This will create a server and listen for any kind of HTTP request on URL `{{localhost:5000}}`; when one is received, it will send a plain-text response "Hello World".
    
danger> `localhost:5000` should not be in code below. Only put the URL `{{templates}}` in instructions, not code. It will be replaced with something like "https://container123123-5000.sandbox.codevolve.com".

danger> `Node.js` is an invalid code syntax highligher. Should be `js`. If the code doesn't show up in pretty colors, it's probably wrong (sometimes there will be no colors in very small code examples though).

danger> Pay attn to port numbers, this should be 8000, not 5000.

```js  
// Load HTTP module
var http = require("http");

// Create HTTP server and listen on port 8000 for requests
http.createServer(function(request, response) {

	 // Set the response HTTP header with HTTP status and Content type
	 response.writeHead(200, {'Content-Type': 'text/plain'});

	 // Send the response body "Hello World"
	 response.end('Hello Worldn');
}).listen(8000);

// Print URL for accessing server
console.log('Server running at {{localhost:5000}}');
```		

Other common web-development tasks are not directly supported by Node itself. If you want to add specific handling for different HTTP verbs (e.g. `GET`, `POST`, `DELETE`, etc.), separately handle requests at different URL paths ("routes"), serve static files, or use templates to dynamically create the response, then you will need to write the code yourself, or you can avoid reinventing the wheel and use a web framework!

danger> _Node_ should just be Node because it's not a filename. **Express** is correct tho!

**Express** is the most popular _Node_ web framework, and is the underlying library for a number of other popular Node web frameworks. It provides mechanisms to:

* Write handlers for requests with different HTTP verbs at different URL paths (routes).
* Integrate with "view" rendering engines in order to generate responses by inserting data into templates.
* Set common web application settings like the port to use for connecting, and the location of templates that are used for rendering the response.
* Add additional request processing "middleware" at any point within the request handling pipeline.

danger> Remove italic on Espress

While _Express_ itself is fairly minimalist, developers have created compatible middleware packages to address almost any web development problem. There are libraries to work with cookies, sessions, user logins, URL parameters, `POST` data, security headers, and many more. You can find a list of middleware packages maintained by the Express team at Express Middleware (along with a list of some popular 3rd party packages).

info> This flexibility is a double edged sword. There are middleware packages to address almost any problem or requirement, but working out the right packages to use can sometimes be a challenge. There is also no "right way" to structure an application, and many examples you might find on the Internet are not optimal, or only show a small part of what you need to do in order to develop a web application.
