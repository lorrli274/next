Open **/views/book_form.pug** and update the section where the author form control is set to have the conditional code shown below.
    
    
        div.form-group
          label(for='author') Author:
          select#author.form-control(type='select' placeholder='Select author' name='author' required='true' )
            for author in authors
              if book
                //- Handle GET form, where book.author is an object, and POST form, where it is a string.
                option(
                  value=author._id
                  selected=(
                    author._id.toString()==book.author._id
                    || author._id.toString()==book.author
                  ) ? 'selected' : false
                ) #{author.name}
              else
                option(value=author._id) #{author.name}

**Note**: This code change is required so that the book_form can be used for both creating and updating book objects (without this, there is an error on the `GET` route when creating a form).
