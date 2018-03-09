Create */views/book_form.pug* and copy in the text below.
    
```js    
extends layout

block content
  h1= title

  form(method='POST' action='')
    div.form-group
      label(for='title') Title:
      input#title.form-control(type='text', placeholder='Name of book' name='title' required='true' value=(undefined===book ? '' : book.title) )
    div.form-group
      label(for='author') Author:
      select#author.form-control(type='select', placeholder='Select author' name='author' required='true' )
        for author in authors
          if book
            option(value=author._id selected=(author._id.toString()==book.author ? 'selected' : false) ) #{author.name}
          else
            option(value=author._id) #{author.name}
    div.form-group
      label(for='summary') Summary:
      input#summary.form-control(type='textarea', placeholder='Summary' name='summary' value=(undefined===book ? '' : book.summary) required='true')
    div.form-group
      label(for='isbn') ISBN:
      input#isbn.form-control(type='text', placeholder='ISBN13' name='isbn' value=(undefined===book ? '' : book.isbn) required='true') 
    div.form-group
      label Genre:
      div
        for genre in genres
          div(style='display: inline; padding-right:10px;')
            input.checkbox-input(type='checkbox', name='genre', id=genre._id, value=genre._id, checked=genre.checked )
            label(for=genre._id) #{genre.name}
    button.btn.btn-primary(type='submit') Submit

  if errors 
    ul
      for error in errors
        li!= error.msg
```

The view structure and behaviour is almost the same as for the *genre_form.pug* template.

The main differences are in how we implement the selection-type fields: `Author` and `Genre`.

* The set of genres are displayed as checkboxes, using the `checked` value we set in the controller to determine whether or not the box should be selected.
* The set of authors are displayed as a single-selection drop-down list. In this case we determine what author to display by comparing the id of the current author option with the value previously entered by the user (passed in as the `book` variable). This is highlighted above! 

info> If there is an error in the submitted form, then, when the form is to be re-rendered, the new book's author is identified only with a string (the value of the selected option in the list of authors). By contrast, the existing books' authors have `_id` properties that are not strings. So to compare the new with the existing we must cast each existing book's author's `_id` to a string, as shown above.
