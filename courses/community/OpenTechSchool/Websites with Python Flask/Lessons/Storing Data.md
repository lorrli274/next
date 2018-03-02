# Storing Email Addresses

At the moment we don't have any way to store email addresses. But if we add a `list` to our website then we can keep them temporarily. Sure, it will only stay around until the web server stops, but it is a good start!

Let's add an empty list to the top of the Python code, just after all the `import` lines and `app = Flask(__name__)`:

```python
email_addresses = []
```
Now in our `signup()` function we can add the email address instead of printing it.

```python
@app.route('/signup', methods = ['POST'])
def signup():
    email = request.form['email']
    email_addresses.append(email)
    print(email_addresses) 
    return redirect('/')
```

Watch the output you get in the console when submitting a form. It prints out the entire list every time.

# Listing Email Addresses

Just printing out our email addresses is a bit of a hassle. If you wanted to read the list then you have to open the terminal and scan through for the printout. It would be so much easier to have a web page that lists all the email addresses that we have collected.

We know how to create a new page in Flask — it's just a function. And we can pass the list of emails directly to a HTML template like so:

```python 
@app.route('/emails.html')
def emails():
    return render_template('emails.html', email_addresses=email_addresses)
```

Here the `render_template()` function takes the name of the template (`'emails.html'`) and extra data to be used when rendering the page. We wrote `email_addresses=email_addresses` to say that our variable `email_addresses` will be available in the template using the same name.

Now we need our HTML template. In our previous template, we didn't actually render anything but plain HTML. But now we need to print the list of email addresses, so we'll use a `for` loop in the template.

Here is an example of the content of _emails.html_ for the _templates_ directory:

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Cats Everywhere email addresses</title>
  </head>
  <body>
    <p>Here are all the emails we have collected:</p>
    <ul>
      {% for email in email_addresses %}
      <li>{{ email }}</li>
      {% endfor %}
    </ul>
    <p>THIS IS GONNA ROCK!</p>
  </body>
</html>
```

Check out the _for_ loop that we use in the template. It is similar to the one used in Python but slightly different. You can see it doesn't contain the `:` at the end of the first line, and it needs an `endfor` statement to end the loop. This comes from the template making use of Flask's Jinja2 templating language, which is designed to be very simple to read and write.

Now you can reboot your server (press Ctrl+C in your console to termiate it), submit some emails, and visit [/emails.html]({{localhost:5000}}/emails.html) to check everything is working as expected! What happens if you restart the server again?

# Success!

Congratulations on completing the Websites with Python Flask lessons. We hope you enjoyed it and encourage you to keep going on the path to web-glory!
