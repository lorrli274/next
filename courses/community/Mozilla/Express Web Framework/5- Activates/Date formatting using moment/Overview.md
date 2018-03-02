The default rendering of dates from our models is very ugly: _Tue Dec 06 2016 15:49:58 GMT+1100 (AUS Eastern Daylight Time)_. In this section we'll show how you can update the _BookInstance List_ page from the previous section to present the `due_date` field in a more friendly format: December 6th, 2016. 

The approach we will use is to create a virtual property in our `BookInstance` model that returns the formatted date. We'll do the actual formatting using [moment][1], a lightweight JavaScript date library for parsing, validating, manipulating, and formatting dates.

**Note:** It is possible to use _moment_ to format the strings directly in our Pug templates, or we could format the string in a number of other places. Using a virtual property allows us to get the formatted date in exactly the same way as we get the `due_date` currently. 
