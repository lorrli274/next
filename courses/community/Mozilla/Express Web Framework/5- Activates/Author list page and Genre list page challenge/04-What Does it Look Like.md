danger>   http://localhost:3000/.  link needs to work in codevolve?

Run the application and open your browser to http://localhost:3000/. Then select the _All authors _link. If everything is set up correctly, the page should look something like the following screenshot.

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Mozilla/LocalLibary_Express_Author_List.png)

info> The appearance of the author lifespan _dates is ugly! You can improve this using the same approach as we used for the `BookInstance` list (adding the virtual property for the lifespan to the `Author` model). This time, however, there are missing dates, and references to nonexistent properties are ignored unless strict mode is in effect. `moment()` returns the current time, and you don't want missing dates to be formatted as if they were today. One way to deal with this is to define the body of the function that returns a formatted date so it returns a blank string unless the date actually exists. For example:

```js
`return this.date_of_birth ? moment(this.date_of_birth).format('YYYY-MM-DD') : '';`
```
