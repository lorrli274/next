The opening screen we see when we point our browser at our app, is a default page which is displayed when there are no routes defined.

Hanami encourages [Behavior Driven Development][14] (BDD) as a way to write web applications. In order to get our first custom page to display, we'll write a high-level feature test:
    
    
    # spec/web/features/visit_home_spec.rb
    require 'features_helper'
    
    describe 'Visit home' do
      it 'is successful' do
        visit '/'
    
        page.body.must_include('Bookshelf')
      end
    end
    

Note that, although Hanami is ready for a Behavior Driven Development workflow out of the box, **it is in no way bound to any particular testing framework** \-- nor does it come with special integrations or libraries.

We'll go with [Minitest][15] here (which is the default), but we can use [RSpec][16] by creating the project with `\--test=rspec` option. Hanami will then generate helpers and stub files for it.

Please check .env.test in case you need to tweak the database URL. 

We have to migrate our schema in the test database by running:
    
    
    % HANAMI_ENV=test bundle exec hanami db prepare
    

As you can see, we have set `HANAMI_ENV` environment variable to instruct our command about the environment to use.
