Before the data from a form is stored, it must be validated and sanitized:

* **Validation** checks that entered values are appropriate for each field (are in the right range, format, etc.) and that values have been supplied for all required fields.
* **Sanitization** removes/replaces characters in the data that might potentially be used to send malicious content to the server.

For this tutorial we'll be using the popular [express-validator](https://www.npmjs.com/package/express-validator) module to perform both validation and sanitization of our form data.
    

## Using `express-validator`

To use the validator in our controllers we have used `require` to load the functions we want to use from the `express-validator/check` and `express-validator/filter_ modules`, as shown below:
    
```javascript
const { body,validationResult } = require('express-validator/check');
const { sanitizeBody } = require('express-validator/filter');
```

There are many functions available, allowing you to check and sanitize data from request parameters, body, headers, cookies, etc., or all of them at once. For this tutorial, we'll primarily be using `body`, `sanitizeBody`, and `validationResult` (as `require`d above).

The functions are defined as below.

#### [`body(fields[, message])`](https://github.com/ctavan/express-validator#bodyfields-message)

Specifies a set of fields in the request body (a `POST` parameter) to validate along with an optional error message that can be displayed if it fails the tests. The validation criteria are daisy-chained to the `body()` method.

For example, the first check below tests that the _name_ field is not empty and sets an error message "Empty name" if it is not. The second test checks that the age field is a valid date, and using `optional()` to specify that null and empty strings will not fail validation.

```javascript
body('name', 'Empty name').isLength({ min: 1 }), 
body('age', 'Invalid age').optional({ checkFalsy: true }).isISO8601(),
```

You can also daisy chain different validators, and add messages that are displayed if the preceding validators are true:

```javascript
body('name').isLength({ min: 1 }).trim().withMessage('Name empty.')
.isAlpha().withMessage('Name must be alphabet letters.'),
```

info> **Note:** You can also add inline sanitizers like `trim()`, as shown above. However sanitizers applied here ONLY apply to the validation step. If you want the final output sanitized, you need to use a separate sanitizer method, as shown below.

---

#### [`sanitizeBody(fields)`](https://github.com/ctavan/express-validator#sanitizebodyfields)

Specifies a body field to sanitize. The sanitization operations are then daisy-chained to this method.

For example, the `escape()` sanitization operation below removes HTML characters from the name variable that might be used in JavaScript cross-site scripting attacks, as shown below:

```javascript
sanitizeBody('name').trim().escape(),
sanitizeBody('date').toDate(),
```

---

#### [`validationResult(req)`](https://github.com/ctavan/express-validator#validationresultreq)

Runs the validation, making errors available in the form of a `validation` result object. This is invoked in a separate callback, as shown below: 

```javascript
(req, res, next) => {
    // Extract the validation errors from a request.
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        // There are errors. Render form again with sanitized values/errors messages.
        // Error messages can be returned in an array using `errors.array()`.
    } else {
        // Data from form is valid.
    }
}
```

We use the validation result's `isEmpty()` method to check if there were errors, and its `array()` method to get the set of error messages. See the [Validation Result API](https://github.com/ctavan/express-validator#validation-result-api) for more information.

The validation and sanitization chains are middleware that should be passed to the Express route handler (we do this indirectly, via the controller). When the middleware runs, each validator/sanitizer is run in the order specified.

We'll cover some real examples when we implement the forms in the next step.
