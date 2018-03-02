[//]: # (content/Open Source/OpenTechSchool/Websites with Python Flask/Lessons/Form Submission.md)

# Form Submission

Rumours of your website have sent the web into a frenzy. Now is the time to move our dusty old static landing page into an exciting and invigorating sign-up page!

To do this we will need two things:
* A HTML form on the web page. This will have a text `<input>` field and a `<submit>` button.
* A **route** in our Flask app to accept the data posted by the form.

At the moment we will just print out the email addresses that we receive directly to the console.

# HTML Form

The form is simple enough:

```html
<form action="/signup" method="post">
  <input type="text" name="email"></input>
  <input type="submit" value="Signup"></input>
</form>
```

> DEV: Start them with https://raw.githubusercontent.com/OpenTechSchool/python-flask-code/master/core/files-templates/templates/index.html as templates/index.html

Place this form inside the `<body>` section of _index.html_. You can fiddle around a bit to get it in the place you want.

# Python Route

Now the action attribute of the form is saying it will be `POST`ed to `/signup`. We don't have any code for this URL at the moment, so it is time to make some!

We are going to need to import more objects from Flask. We need `request` to get the form data, `redirect` to redirect the browser once we are done. Add this to the top of your Python code:

```python
from flask import request, redirect
```

Now we can add our new route for `/signup`.

```python
@app.route('/signup', methods = ['POST'])
def signup():
    email = request.form['email']
    print("The email address is '" + email + "'")
    return redirect('/')
```

This gets a little complicated, so we'll go through it line-by-line:

```python
@app.route('/signup', methods = ['POST'])
```

We apply a **decorator** to the signup function, saying that we want it to be used when the browser requests `/signup`. It will accept the HTTP `POST` method, which you can see is mentioned in the HTML form element as `method="post"`.

```python
def signup():
    email = request.form['email']
    print("The email address is '" + email + "'")
```

In the signup method we can retrieve the email address using the `request` object, which contains the form data. In the HTML we used `name="email"`, which means that in the `request` object we can use `request.form["email"]`. If we used `name="address"` in the HTML then it would be `request.form["address"]`.

When we write `request.form["email"]` we are using `request.form` as a Python dictionary, looking up the entry held in there for `"email"`.

At this stage, we just print out the email address that's supplied. So when you submit the form you should be able to see the address you supplied printed out on the console.

```python
return redirect('/')
```

Once we have printed the email address we still need a response to send back to the web browser. A common option is to send a HTTP _Redirect_ response. This tells the browser to go to another page. In our case we just send them back to the home page, `/`, which is served by the `hello_world()` function.

# Try it out!

Give it a whirl and see how the email addresses get printed to the console. Perhaps you would like to experiment by adding some extra form elements such as a text box for a name, or a checkbox for also including dogs.
