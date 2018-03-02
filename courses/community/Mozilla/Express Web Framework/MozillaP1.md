# Express Tutorial: The Local Library website - Learn web development

The first article in our practical tutorial series explains what you'll learn, and provides an overview of the "local library" example website we'll be working through and evolving in subsequent articles.

## Overview

Welcome to the MDN "Local Library" Express (Node) tutorial, in which we develop a website that might be used to manage the catalog for a local library. 

In this series of tutorial articles you will:

* Use the _Express Application Generator_ tool to create a skeleton website and application.
* Start and stop the Node web server.
* Use a database to store your application's data.
* Create routes for requesting different information, and templates ("views") to render the data as HTML to be displayed in the browser.
* Work with forms.
* Deploy your application to production.

You have learnt about some of these topics already, and touched briefly on others. By the end of the tutorial series you should know enough to develop simple Express apps by yourself.

## The LocalLibrary website

_LocalLibrary_ is the name of the website that we'll create and evolve over the course of this series of tutorials. As you'd expect, the purpose of the website is to provide an online catalog for a small local library, where users can browse available books and manage their accounts.

This example has been carefully chosen because it can scale to show as much or little detail as we need, and can be used to show off almost any Express feature. More importantly, it allows us to provide a _guided_ path through the functionality you'll need in any website:

* In the first few tutorial articles we will define a simple _browse-only _library that library members can use to find out what books are available. This allows us to explore the operations that are common to almost every website: reading and displaying content from a database.
* As we progress, the library example naturally extends to demonstrate more advanced website features. For example we can extend the library to allow new books to be created, and use this to demonstrate how to use forms, and support user authentication.

Even though this is a very extensible example, it's called _**Local**Library_ for a reason — we're hoping to show the minimum information that will help you get up and running with Express quickly. As a result we'll store information about books, copies of books, authors and other key information. We won't however be storing information about other items a library might lend, or provide the infrastructure needed to support multiple library sites or other "big library" features. 

## I'm stuck, where can I get the source?

As you work through the tutorial we'll provide the appropriate code snippets for you to copy and paste at each point, and there will be other code that we hope you'll extend yourself (with some guidance).

If you get stuck, you can find the fully developed version of the website [on Github here][1].

**Note:** The specific versions of node, Express, and the other modules that this documentation was tested against are listed in the project [package.json][2].

## Summary

Now that you know a bit more about the _LocalLIbrary_ website and what you're going to learn, it's time to start creating a [skeleton project][3] to contain our example.
