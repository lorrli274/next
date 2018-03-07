Let's use [form helpers][33] to build this form in `apps/web/templates/books/new.html.erb`:
    
    
    # apps/web/templates/books/new.html.erb
    
Add book

    
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
    

We've added `` tags for our form fields, and wrapped each field in a container `
` using Hanami's [HTML builder helper][34].
