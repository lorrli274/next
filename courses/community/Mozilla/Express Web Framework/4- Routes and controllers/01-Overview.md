The first thing we need to do is determine what information we want to be able to display in our pages, and then define appropriate URLs for returning those resources. Then we're going to need to create the routes (URL handlers) and views (templates) to display those pages.

The diagram below is provided as a reminder of the main flow of data and things that need to be implemented when handling an HTTP request/response. In addition to the views and routes the diagram shows "controllers" — functions that separate out the code to route requests from the code that actually processes requests.

As we've already created the models, the main things we'll need to create are:

* **Routes** to forward the supported requests (and any information encoded in request URLs) to the appropriate controller functions.
* **Controller** functions to get the requested data from the models, create an HTML page displaying the data, and return it to the user to view in the browser.
* **Views** (templates) used by the controllers to render the data.

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Mozilla/MVC%20Express.png)

Ultimately we might have pages to show lists and detail information for books, genres, authors and bookinstances, along with pages to create, update, and delete records. That's a lot to document in one article. Therefore most of this article will concentrate on setting up our routes and controllers to return "dummy" content. We'll extend the controller methods in our subsequent articles to work with model data.

The first section below provides a brief "primer" on how to use the Express Router middleware. We'll then use that knowledge in the following sections when we set up the LocalLibrary routes.
