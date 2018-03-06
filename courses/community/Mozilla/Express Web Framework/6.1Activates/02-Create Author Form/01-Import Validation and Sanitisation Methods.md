As with the genre form, to use _express-validator _ we have to _require_  the functions we want to use.

Open */controllers/authorController.js*, and add the following lines at the top of the file:
    
```Javascript    
const { body,validationResult } = require('express-validator/check');
const { sanitizeBody } = require('express-validator/filter');
```		
