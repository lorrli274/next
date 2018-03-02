# HTTP

Now that we have Python and Flask installed it's time to start with our first website. But first, it helps to know a little about how your web browser retrieves web pages from a web server.

The **HyperText Transfer Protocol** is what your browser speaks to talk to a web server. In HTTP, the browser will make a **request** and the server sends back a **response**.

There are two main types of request, `GET` and `POST`.

* The browser sends a `GET` request to retrieve data. For example, going to `https://www.next.xyz/catalog` will cause the browser to send `GET /catalog` to Next.xyz's server.
* The `POST` request is used to send data. For example, if you fill out a web form and click Submit, it will usually send the form data back to the server through a `POST`.

We will be handling both `GET` and `POST` requests in our app! First, we'll handle a GET request with the Hello World example. Then later we will try using `POST`s to receive an email address.

# Hello World - A Static Website

In the early days, people would write web pages files in a directory being watched by an [Apache](https://httpd.apache.org/) server. It was simple, but limiting. The content was **static**, with no way to make it change without editing the files on the server. Today we are going to start with something just as simple.

> DEV: Create the file below as a snippet

Open the _hello_server.py_ file. Its contents might look a little cryptic:

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World!'

if __name__ == '__main__':
    app.run()
```

Let's break it down a little:

```python
from flask import Flask

app = Flask(__name__)
```

This imports the Flask library and creates a new website in a variable called `app`.

```python
@app.route('/')
def hello_world():
    return 'Hello World!'
```

The `@` is new, it's called a **decorator** and it is used to augment function definitions. Flask uses `route()` to say that if the browser requests the address `/` (the default, or home address), then our app should **route** that request to this `hello_world` function.

The function itself returns the string _Hello World!_. This will be sent to the web browser.

```python
if __name__ == '__main__':
    app.run()
```

`if __name__ == '__main__'` indicates that if this script is run directly, it should do everything in the code block below (in this case, start the application).

Now you can start running your first website! Type the following into your terminal:

```bash
$ python hello_server.py 
 * Running on http://127.0.0.1:5000/
```

Open that address in your browser! It probably looks something like this:

> DEV: Pull in image

![](images/hello-world.png)
