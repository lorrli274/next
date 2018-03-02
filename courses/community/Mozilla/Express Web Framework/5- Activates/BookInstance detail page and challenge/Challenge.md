Currently most _dates_ displayed on the site use the default JavaScript format (e.g. _Tue Dec 06 2016 15:49:58 GMT+1100 (AUS Eastern Daylight Time)_. The challenge for this article is to improve the appearance of the date display for `Author` lifespan information (date of death/birth) and for _BookInstance detail_ pages to use the format: December 6th, 2016.

**Note:** You can use the [same approach][2] as we used for the _Book Instance List_ (adding the virtual property for the lifespan to the `Author` model and use [moment][3] to format the date strings).

The requirements to meet this challenge:

1. Replace the variable `due_back` with `due_back_formatted` in the _BookInstance detail_ page.
2. Update the Author module to add a lifespan virtual property. The lifespan should look like: _date_of_birth - date_of_death_, where both values have the same date format as `BookInstance.due_back_formatted`.
3. Use `Author.lifespan` in all views where you currently explicitly use `date_of_birth` and `date_of_death`.

Return to [Express Tutorial Part 5: Displaying library data][4].
