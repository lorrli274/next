In this step you should implement your own genre list page. The page should display a list of all genres in the database, with each genre linked to its associated detail page. A screenshot of the expected result is shown below.

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Mozilla/LocalLibary_Express_Genre_List.png)

The genre list controller function needs to get a list of all `Genre` instances, and then pass these to the template for rendering.

1. You will need to edit `genre_list()` in */controllers/genreController.js*. 
2. The implementation is almost exactly the same as the `author_list()` controller. 
    * Sort the results by name, in ascending order.
3. The template to be rendered should be named *genre_list.pug*.
4. The template to be rendered should be passed the variables `title` ('Genre List') and `genre_list` (the list of genres returned from your `Genre.find()` callback.
5. The view should match the screenshot/requirements above (this should have a very similar structure/format to the Author list view, except for the fact that genres do not have dates).
