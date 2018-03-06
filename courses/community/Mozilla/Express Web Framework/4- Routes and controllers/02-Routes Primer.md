A **route** is a section of Express code that associates an HTTP verb (`GET`, `POST`, `PUT`, `DELETE`, etc.), an URL path/pattern, and a function that is called to handle that pattern.

There are several ways to create routes. For this tutorial we're going to use the [`express.Router](http://expressjs.com/en/guide/routing.html#express-router)` middleware as it allows us to group the route handlers for a particular part of a site together and access them using a common route-prefix. We'll keep all our library-related routes in a "catalog" module, and, if we add routes for handling user accounts or other functions, we can keep them grouped separately.

We discussed Express application routes briefly in our [Express Introduction > Creating route handlers]. Other than providing better support for modularization (as discussed in the first subsection below), using _Router_ is very similar to defining routes directly on the _Express application object_.

The rest of this section provides an overview of how the `Router` can be used to define the routes.
