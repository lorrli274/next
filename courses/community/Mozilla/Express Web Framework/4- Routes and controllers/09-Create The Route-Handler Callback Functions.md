Before we define our routes, we'll first create all the dummy/skeleton **callback functions** that they will invoke. The callbacks will be stored in separate "controller" modules for Books, BookInstances, Genres, and Authors (you can use any file/module structure, but this seems an appropriate granularity for this project).

Start by creating a folder for our controllers in the project root (**/controllers**) and then create separate controller files/modules for handling each of the models:

```js
/Express-locallibrary-tutorial  //the project root
	/Controllers
		AuthorController.js
		BookController.js
		BookinstanceController.js
		GenreController.js
```
