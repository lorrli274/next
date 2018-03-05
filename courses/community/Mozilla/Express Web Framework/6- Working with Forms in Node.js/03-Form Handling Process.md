**Form handling** requires logic to perform the following steps:

1. The route sends our request to a controller function
2. The function performs any database actions required, including reading data from the models
3. Then the function generates and returns an HTML page

What makes things more complicated is that the server also needs to be able to process data provided by the user, and redisplay the form with error information if there are any problems.

A process flowchart for processing form requests is shown below, starting with a request for a page containing a form (shown in green):

![](https://mdn.mozillademos.org/files/14478/Web%20server%20form%20handling.png)

As shown in the diagram above, the main things that form handling code needs to do are:

1. Display the default form the first time it is requested by the user. 
    * The form may contain blank fields (e.g. if you're creating a new record), or it may be pre-populated with initial values (e.g. if you are changing a record, or have useful default initial values).
2. Receive data submitted by the user, usually in an HTTP `POST` request.
3. Validate and sanitize the data.
4. If any data is invalid, re-display the form—this time with any user populated values and error messages for the problem fields.
5. If all data is valid, perform required actions (e.g. save the data in the database, send a notification email, return the result of a search, upload a file, etc.)
6. Once all actions are complete, redirect the user to another page.

Often form handling code is implemented using a `GET` route for the initial display of the form and a `POST` route to the same path for handling validation and processing of form data. This is the approach that will be used in this lesson!

Express itself doesn't provide any specific support for form handling operations, but it can use middleware to process `POST` and `GET` parameters from the form, and to validate/sanitize their values.
