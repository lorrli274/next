# Files

So you've seen how to send out some basic text with a simple Flask application, and the languages that are used to build the web: HTML, CSS, and Javascript. Serving text isn't enough though - what if we want to serve some actual **files**?

Luckily, Flask comes prepared. All you have to do is create a folder in the same directory as _hello_world.py_ with the special name of _static_. Any file you put in that folder will be served by Flask automatically! It's one of the nice functionalities provided to you by Flask's authors.

You can do this with your file browser, or on the command line by typing `mkdir static`.

So, if you made a file in the static folder called `cats.gif`, and you'd normally access your application by visiting the URL [http://localhost:5000]({{localhost:5000}}), then you can view that file by going to [http://localhost:5000/static/cats.gif]({{localhost:5000}}/static/cats.gif).

Check if this works for you by downloading a funny image from the internet (there are plenty at [imgur](http://imgur.com)), uploading it to the _static_ folder, running your Flask application in the terminal (`python hello_world.py`), and browsing to your image by the right URL.

The _static_ folder is a great place to put CSS stylesheets, JavaScript script files, and images. Those files don't usually change much when a website is running, hence the folder name. A common practice is that web developers will organize these files in sub-directories called, for instance, _css_, _js_, and _img_ respectively. 

# HTML Templates

None of that explains where to put the **content** of our application - the actual **HTML**. Flask makes use of HTML templating which allows it to put dynamic application data (like a list of email addresses that changes over time) into the HTML, so that any web browser can view it easily, and it looks good as well!

Flask uses another special directory to store templates, called _templates_ (clever, huh?), so go ahead and create it, like you did for _static_.

In it, create a file called _index.html_ and chuck some in some HTML:

```html
<!DOCTYPE html>
<html>
  <head>
    <title>{{ author }}'s app</title>
  </head>

  <body>
    <h2>Hello {{ name }}!</h2>
  </body>
</html>
```

This is a pretty simple HTML page, but it includes two bits of Flask's templating language. When Flask shows this template to your browser, it will replace `{{ author }}` and `{{ name }}` with what you assign those two variables in your application. If an author was assigned to be "Bob", then the title of the page served will be "Bob's app".

In this way, a template separates what the content of the page should be, from the actual **data** that will be used as that content. This makes things a whole lot easier if you have to write a lot of dynamic web pages!

Flask's templates can do a good deal more than just display variables, but we will get to that in good time.

Let's modify our flask app to serve the template:

```python
from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def hello_world():
    author = "Me"
    name = "You"
    return render_template('index.html', author=author, name=name)

if __name__ == "__main__":
    app.run()
```

You can see we imported a new function from `flask`, called `render_template`.

Then in `hello_world()`, we added two variables called `author` and `name`. You can change their values from `"Me"` and `"You"` in your file, since those are boring!

Then instead of returning some text, we returned the result of calling `render_template`. First, we give it the file name of the template we wish to process. Then, we pass in the variable names that the template should know about (`author` and `name`) and what their values should be (...coincidentally, `author` and `name`!). This function should load up the template, do the processing required to replace placeholders with values, and return the full HTML text.

Now try running and [viewing your app]({{localhost:5000}}), in all its HTML glory!

# A Prettier Home Page

Now that we have a bit more confidence in changing the home page we can start making something a bit prettier. We want the home page of our website to be fun and exciting. Something that says "Yes, these people know what they are doing. I will give them my email address in hope of seeing more of their work in the future."

This means fancy fonts, large bold type, huge banner images and nice round corners and such. We are going to need some more interesting HTML and a fair bit of CSS to get it looking pretty.

> DEV: Download https://raw.github.com/OpenTechSchool/python-flask-code/master/core/files-templates/templates/index.html and put it in GCP storage, then update link below.

We've prepared a self-contained template that you can use for the home page. You can download it [here](TODO) and upload it to your _templates_ directory.

It should look a little something like this:

> DEV: Download this image and host it ourselves

![](https://pbs.twimg.com/media/BGPsFh9CYAAcrct.png:large)
