Rather than just shoving the user a form under their nose when something has gone wrong, we should give them a hint of what's expected of them. Let's adapt our form to show a notice about invalid fields.

First, we expect a list of errors to be included in the page when `params` contains errors:
    
```ruby    
# spec/web/views/books/new_spec.rb
require_relative '../../../spec_helper'

describe Web::Views::Books::New do
  let(:params)    { OpenStruct.new(valid?: false, error_messages: ['Title must be filled', 'Author must be filled']) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/books/new.html.erb') }
  let(:view)      { Web::Views::Books::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    rendered.must_include('There was a problem with your submission')
    rendered.must_include('Title must be filled')
    rendered.must_include('Author must be filled')
  end
end
```

We should also update our feature spec to reflect this new behavior:
    
```ruby    
# spec/web/features/add_book_spec.rb
require 'features_helper'

describe 'Add a book' do
  # Spec written earlier omitted for brevity

  it 'displays list of errors when params contains errors' do
    visit '/books/new'

    within 'form#book-form' do
      click_button 'Create'
    end

    current_path.must_equal('/books')

    assert page.has_content?('There was a problem with your submission')
    assert page.has_content?('Title must be filled')
    assert page.has_content?('Author must be filled')
  end
end
```

In our template we can loop over `params.errors` (if there are any) and display a friendly message. Open up `apps/web/templates/books/new.html.erb` and add the following at the top of the file:

```erb
<% unless params.valid? %>
  <div class="errors">
    <h3>There was a problem with your submission</h3>
    <ul>
      <% params.error_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
    </ul>
  </div>
<% end %>
```

Run your tests again and see they are all passing again!
    
```    
% bundle exec rake
Run options: --seed 59940

# Running:

......S..........

Finished in 0.188950s, 89.9707 runs/s, 179.9413 assertions/s.

17 runs, 34 assertions, 0 failures, 0 errors, 1 skips

You have skipped tests. Run with --verbose for details.
```
