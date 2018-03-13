Let's use [form helpers](http://hanamirb.org/guides/1.0/helpers/forms) to build this form in `apps/web/templates/books/new.html.erb`:
    

```erb
# apps/web/templates/books/new.html.erb
<h2>Add book</h2>

<%=
  form_for :book, '/books' do
    div class: 'input' do
      label      :title
      text_field :title
    end

    div class: 'input' do
      label      :author
      text_field :author
    end

    div class: 'controls' do
      submit 'Create Book'
    end
  end
%>
```

We've added `<label>` tags for our form fields, and wrapped each field in a
container `<div>` using Hanami's [HTML builder helper](http://hanamirb.org/guides/1.0/helpers/html5).
