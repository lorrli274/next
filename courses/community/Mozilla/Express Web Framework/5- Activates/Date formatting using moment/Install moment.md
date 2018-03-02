
Enter the following command in the root of the project:
    
    
    npm install moment --save

#### Create the virtual property

1. Open **./models/bookinstance.js**.
2. At the top of the page, import _moment_. 
    
        var moment = require('moment');

Add the virtual property `due_back_formatted` just after the url property.
    
    
    BookInstanceSchema
    .virtual('due_back_formatted')
    .get(function () {
      return moment(this.due_back).format('MMMM Do, YYYY');
    });

**Note:** The format method can display a date using almost any pattern. The syntax for representing different date components can be found in the [moment documentation][2].
