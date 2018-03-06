Create */views/Author_form.pug* and copy in the text below.
    
```Javascript    
extends layout

block content
  h1=title

  form(method='POST' action='')
    div.form-group
      label(for='first_name') First Name:
      input#first_name.form-control(type='text', placeholder='First name (Christian) last' name='first_name' required='true' value=(undefined===author ? '' : author.first_name) )
      label(for='family_name') Family Name:
      input#family_name.form-control(type='text', placeholder='Family name (surname)' name='family_name' required='true' value=(undefined===author ? '' : author.family_name))
    div.form-group
      label(for='date_of_birth') Date of birth:
      input#date_of_birth.form-control(type='date', name='date_of_birth', value=(undefined===author ? '' : author.date_of_birth) )
    button.btn.btn-primary(type='submit') Submit
  if errors 
    ul
      for error in errors
        li!= error.msg
```

The structure and behaviour for this view is exactly the same as for the **Genre_form.pug** template, so we won't describe it again.

Some browsers don't support the input `type="date"`, so you won't get the datepicker widget or the default _`dd/mm/yyyy`_ placeholder, but will instead get an empty plain text field. One workaround is to explicitly add the attribute `placeholder='dd/mm/yyyy'` so that on less capable browsers you will still get information about the desired text format.

