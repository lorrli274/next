Open **/controllers/bookinstanceController.js**, and add the following lines at the top of the file:
    
    
    const { body,validationResult } = require('express-validator/check');
    const { sanitizeBody } = require('express-validator/filter');