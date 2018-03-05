This article shows how you can create a **skeleton** website using the Express Application Generator tool, which you can then populate with site-specific routes, views/templates, and database calls. In this case we'll use the tool to create the framework for our Local Library website, to which we'll later add all the other code needed by the site. The process is extremely simple, requiring only that you invoke the generator on the command line with a new project name, optionally also specifying the site's template engine and CSS generator.

The following sections show you how to call the application generator, and provides a little explanation about the different view/CSS options. We'll also explain how the skeleton website is structured. At the end we'll show how you can run the website to verify that it works.

The _Express Application Generator_ is not the only generator for Express applications, and the generated project is not the only viable way to structure your files and directories. The generated site does however have a modular structure that is easy to extend and understand.