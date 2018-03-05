An **HTML Form** is a group of one or more fields/widgets on a web page that can be used to collect information from users for submission to a server. Forms are a flexible mechanism for collecting user input because there are suitable form inputs available for entering many different types of data—text boxes, checkboxes, radio buttons, date pickers, etc. Forms are also a relatively secure way of sharing data with the server, as they allow us to send data in `POST` requests with CSRF protection.

Working with forms can be complicated! Developers need to:
* Write HTML for the form
* Validate and properly sanitize entered data on the server (and possibly also in the browser)
* Repost the form with error messages to inform users of any invalid fields
* Handle the data when it has successfully been submitted
* And finally, respond to the user in some way to indicate success

In this course you'll learn how the above operations may be performed in the **Express** framework. You'll extend a website developed to support the local library to allow users to create, edit and delete items.

success> For now, follow allong with the contents of this lesson to explore new concepts as they are introduced. The coding environment on the right is fully interactive, so feel free to edit code, run commands, and browse the current website!
