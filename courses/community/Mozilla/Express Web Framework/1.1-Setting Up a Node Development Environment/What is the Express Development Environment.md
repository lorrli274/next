The Express **development environment** includes an installation of Nodejs, the NPM package manager, and (optionally) the Express Application Generator on your local computer.

Node and the NPM package manager are installed together from preprepared binary packages, installers, operating system package managers or from source (as shown in the following sections). Express is then installed by NPM as a dependency of your individual Express web applications (along with other libraries like template engines, database drivers, authentication middleware, middleware to serve static files, etc.)

NPM can also be used to (globally) install the Express Application Generator, a handy tool for creating skeleton Express web apps that follow the [MVC pattern](https://developer.mozilla.org/en-) The application generator is optional because you don't _need_ to use this tool to create apps that use Express, or construct Express apps that have the same architectural layout or dependencies. We'll be using it though, because it makes getting started a lot easier, and promotes a modular application structure.

info> Unlike for some other web frameworks, the development environment does not include a separate development web server. In Node/Express a web application creates and runs its own web server!

There are other peripheral tools that are part of a typical development environment, including [text editors](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/Available_text_editors) or IDEs for editing code, and source control management tools like [Git](https://git-scm.com/) for safely managing different versions of your code. We are assuming that you've already got these sorts of tools installed (in particular a text editor).
