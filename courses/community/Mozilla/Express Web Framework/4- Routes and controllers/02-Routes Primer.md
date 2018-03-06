A **route** is a section of Express code that associates an HTTP verb (`GET`, `POST`, `PUT`, `DELETE`, etc.), an URL path/pattern, and a function that is called to handle that pattern.

There are several ways to create routes. For this tutorial we're going to use the [express.Router](http://expressjs.com/en/guide/routing.html#express-router) middleware as it allows us to group the route handlers for a particular part of a site together and access them using a common route-prefix. We'll keep all our library-related routes in a "catalog" module, and, if we add routes for handling user accounts or other functions, we can keep them grouped separately.

info> We discussed express application routes briefly in the Express/Node Introduction lesson. Other than providing better support for modularization, using Router is very similar to defining routes directly on the Express application object.
