The Express Application Generator allows you to configure a number of popular view/templating **engines**, including [EJS](https://www.npmjs.com/package/ejs), [Hbs](https://github.com/pillarjs/hbs), [Pug](https://pugjs.org/api/getting-started.html) (Jade), [Twig](https://www.npmjs.com/package/twig), and [Vash](https://www.npmjs.com/package/vash), although it chooses Jade by default if you don't specify a view option. Express itself can also support a large number of other [templating languages](https://github.com/expressjs/express/wiki#template-engines) out of the box.

Info> If you want to use a template engine that isn't supported by the generator then see [Using template engines with Express](https://expressjs.com/en/guide/using-template-engines.html) (Express docs) and the documentation for your target view engine.

Generally speaking you should select a templating engine that delivers all the functionality you need and allows you to be productive sooner — or in other words, in the same way that you choose any other component! Some of the things to consider when comparing template engines:

* Time to productivity — If your team already has experience with a templating language then it is likely they will be productive faster using that language. If not, then you should consider the relative learning curve for candidate templating engines.
* Popularity and activity — Review the populartity of the engine and whether it has an active community. It is important to be able to get support for the engine when you have problems over the lifetime of the website.
* Style — Some template engines use specific markup to indicate inserted content within "ordinary" HTML, while others construct the HTML using a different syntax (for example, using indentation and block names).
* Performance/rendering time.
* Features — you should consider whether the engines you look at have the following features available: 
    * Layout inheritence: Allows you to define a base template and then "inherit" just the parts of it that you want to be different for a particular page. This is typically a better approach than building templates by including a number of required components, or building a template from scratch each time.
    * "Include" support: Allows you to build up templates by including other templates.
    * Concise variable and loop control syntax.
    * Ability to filter variable values at template level (e.g. making variables upper-case, or formatting a date value).
    * Ability to generate output formats other than HTML (e.g. JSON or XML).
    * Support for asynchronous operations and streaming.
    * Can be used on the client as well as the server. If a templating engine can be used on the client this allows the possibility of serving data and having all or most of the rendering done client-side.

For this project we'll use the Pug templating engine (this is the recently-renamed Jade engine), as this is one of the most popular Express/JavaScript templating languages and is supported out of the box by the generator.
