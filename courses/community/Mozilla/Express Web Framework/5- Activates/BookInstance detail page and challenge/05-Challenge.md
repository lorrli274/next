Currently most dates displayed on the site use the default JavaScript format (e.g. Tue Dec 06 2016 15:49:58 GMT+1100 (AUS Eastern Daylight Time). The challenge for this activity is to improve the appearance of the date display for `Author` lifespan information (date of death/birth) and for BookInstance detail pages to use the format: December 6th, 2016.

info> You can use the same approach as we used for the Book Instance List (adding the virtual property for the lifespan to the `Author` model and use [moment](https://www.npmjs.com/package/moment) to format the date strings).

The requirements to meet this challenge:

1. Replace the variable `due_back` with `due_back_formatted` in the BookInstance detail page.
2. Update the Author module to add a lifespan virtual property. The lifespan should look like: date_of_birth - date_of_death, where both values have the same date format as `BookInstance.due_back_formatted`.
3. Use `Author.lifespan` in all views where you currently explicitly use `date_of_birth` and `date_of_death`.
