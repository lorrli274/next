# Express Tutorial Part 5: Displaying library data - Learn web development

We're now ready to add the pages that display the [LocalLibrary][1] website books and other data. The pages will include a home page that shows how many records we have of each model type, and list and detail pages for all of our models. Along the way we'll gain practical experience in getting records from the database, and using templates.

| ----- |
| Prerequisites: |  Complete previous tutorial topics (including [Express Tutorial Part 4: Routes and controllers][2]). |  
| Objective: |  To understand how to use the async module and Pug template language, and how to get data from the URL in our controller functions. | 

## Overview

In our previous tutorial articles we defined [Mongoose models][3] that we can use to interact with a database and created some initial library records. We then [created all the routes][2] needed for the LocalLibrary website, but with "dummy controller" functions (these are skeleton controller functions that just return a "not implemented" message when a page is accessed).

The next step is to provide proper implementations for the pages that _display_ our library information (we'll look at implementing pages featuring forms to create, update, or delete information in later articles). This includes updating the controller functions to fetch records using our models, and defining templates to display this information to users.

We will start by providing overview/primer topics explaining how to manage asynchronous operations in controller functions and how to write templates using Pug. Then we'll provide implementations for each of our main "read only" pages with a brief explanation of any special or new features that they use.

At the end of this article you should have a good end-to-end understanding of how routes, asynchronous functions, views, and models work in practice.

## Displaying library data tutorial subarticles

The following subarticles go through the process of adding the different features required for us to display the required website pages. You need to read and work through each one of these in turn, before moving on to the next one.

1. [Asynchronous flow control using async][4]
2. [Template primer][5]
3. [The LocalLibrary base template][6]
4. [Home page][7]
5. [Book list page][8]
6. [BookInstance list page][9]
7. [Date formatting using moment][10]
8. [Author list page and Genre list page challenge][11]
9. [Genre detail page][12]
10. [Book detail page][13]
11. [Author detail page][14]
12. [BookInstance detail page and challenge][15]

## Summary

We've now created all the "read-only" pages for our site: a home page that displays counts of instances of each of our models, and list and detail pages for our books, book instances, authors, and genres. Along the way we've gained a lot of fundamental knowledge about controllers, managing flow control when using asynchronous operations, creating views using _Pug_, querying the database using our models, how to pass information to a template from your view, and how to create and extend templates. Those who completed the challenge will also have learned a little about date handling using _moment_.

In our next article we'll build on our knowledge, creating HTML forms and form handling code to start modifying the data stored by the site.
  
