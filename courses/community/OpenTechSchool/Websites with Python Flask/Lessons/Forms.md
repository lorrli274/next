# Forms

Now that we have a pretty home page it's time to put a **form** on it. This will let people submit their email address. You've probably seen HTML forms a billion times already. Now we will take a brief tour of how forms work:

> DEV: Go to https://github.com/Codevolve/content/tree/master/Open%20Source/OpenTechSchool/Websites%20with%20Python%20Flask/images and update image references below

![HTML Sample Form](images/sample_web_form.png)

This one comes from the world renowned Web 2.0 startup company "The Corner Pizza Shop".

Forms start with the `<form>` tag. This marks the start of the form area, and can surround basically anything inside the HTML body. A form area starts like this:

```html
<form action="post.html" method="post">
```

This means: this form sends an HTTP `POST` to a page on the server called `post.html`.

Inside the `<form>` tag there are a number of different `<input>` tags available:

# Text Input

![HTML Sample Form](images/form-input.png)

The **text input** element allows people to type in one line of text. The input type is `text`.

```html
<input type="text" name="name"></input>
```

Whatever is typed into this text box will be sent to the server with the variable `name`.

# Radio Buttons

![HTML Sample Form](images/form-radio.png)

**Radio buttons** allow users to select one option from many. They are named from the preset buttons on car radios.

To create some radio buttons you use the input type `radio`:

```html
<input type="radio" name="topping" value="supreme">Supreme</input>
<input type="radio" name="topping" value="vegetarian">Vegetarian</input>
<input type="radio" name="topping" value="hawaiian">Hawaiian</input>
```

Here we can see that each `<input>` has a type of `radio` and the same name, `topping`. It is important that each radio input has the same name, so they're all grouped together. The selected radio option will be sent back to the server with variable `topping`. The value of that variable will be one of the choices - _supreme_, _vegetarian_ or _hawaiian_.

# Select Dropdown

![HTML Sample Form](images/form-select.png)

Select input is a little trickier. The `<select>` tag groups a list of `<option>` tags. Like this:

```html
<select name="sauce">
  <option value="tomato">Tomato</option>
  <option value="barbeque">Barbeque</option>
  <option value="mayonnaise">Mayonnaise</option>
  <option value="secret">Secret Sauce</option>
</select>
```

When sent back to the server the browser will use the variable name `sauce` and the value of the selected option.

![HTML Sample Form](images/form-dropdown.png)

There are a couple of gotchas with select boxes:

* There is no built-in way to say "Select an option..." when the user has not selected an option yet. Although this is a very common scenario, and the browser automatically selects the first option which may be confusing. In HTML you have to specifically create a `<option>` tag containing "Select an option...".
* To automatically select an option when the page loads you can use the `selected` attribute on the option, like this:

```html
<option selected="selected" value="secret">Secret Sauce</option>
```

# Checkbox

![HTML Sample Form](images/form-checkbox.png)

A **checkbox** allows simple yes/no style answers for forms. They can be a little tricky because there are two ways to use them.

The first is simply to create a different name for each option:

```html
<input type="checkbox" name="extra_cheese" value="1">Extra Cheese</input>
<input type="checkbox" name="gluten_free" value="1">Gluten Free Base</input>
```

When both are selected this will send back two variables, `extra_cheese` and `gluten_free`. Each variable will have the value `1` if the checkbox is checked.

The second is to use one name for each option:

```html
<input type="checkbox" name="extras" value="extra_cheese">Extra Cheese</input>
<input type="checkbox" name="extras" value="gluten_free">Gluten Free Base</input>
```

When both are selected this will send back one variable, `extras`, containing any value that is checked. Multiple values are separated by commas - for example `extra_cheese,gluten_free`. It is up to the server to split the value back into separate items.

# Textarea

![HTML Sample Form](images/form-textarea.png)

When you want more than a single line of text from a user you can use the **textarea** tag:

```html
<textarea name="delivery" cols="50" rows="4"></textarea>
```

It even has the archaic `cols` and `rows` attributes, which hark back to the days of green-screen text terminals. These attributes decide the size of the textarea, but generally you should just use CSS.

# Submit Button

![HTML Sample Form](images/form-submit.png)

To get everything back to the server you need a submit button:

```html
<input type="submit" value="Send my Order">
```

When clicked the browser knows it is time to submit the form data back to the server. The browser gathers all the data in the `<input>`, `<select>` and `<textarea>` tags and sends them to the URL mentioned in the `action` element of the `<form>` tag.

# From Static To Dynamic

This ability to request and capture content from users is what changes a website from **static** to **dynamic**. Just about anyone can write an HTML page with static content and have it hosted by a webserver. But to accept data from users through a `<form>`, process it, and store the result marks the shift from being a page author to a programmer.
