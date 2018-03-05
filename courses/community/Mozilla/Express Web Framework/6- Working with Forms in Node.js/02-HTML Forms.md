First a brief overview of **HTML forms**. Consider a simple HTML form, with a single text field for entering the name of some "team", and its associated label:

![](https://mdn.mozillademos.org/files/14117/form_example_name_field.png)

The form is defined in HTML as a collection of elements inside `<form>...</form>` tags, containing at least one `input` element of `type="submit"`.
    
```html
<form action="/team_name_url/" method="post">
    <label for="team_name">Enter name: </label>
    <input id="team_name" type="text" name="name_field" value="Default name for team.">
    <input type="submit" value="OK">
</form>
```

While here we have included just one (text) field for entering the team name, a form may contain any number of other input elements and their associated labels. Each field has several special properties:

* The `type` attribute defines what sort of widget will be displayed
* The `name` and `id` of the field are used to identify the field in JavaScript/CSS/HTML
* The `value` attribute defines the initial value for the field when it is first displayed
* The matching team label is specified using the `label` tag (see "Enter name" above), with a `for` field containing the `id` value of the associated `input`

The `submit` input will be displayed as a button (by default) and can be pressed by the user to upload the data contained by the other input elements to the server. In this case, that's the `team_name`. The form attributes define the HTTP `method` used to send the data and the destination of the data on the server (the `action`):

To summarize, here are the terms relating to form submission:
* `action`: The resource/URL where data is to be sent for processing when the form is submitted. If this is not set (or set to an empty string), then the form will be submitted back to the current page URL.
* `method`: The HTTP method used to send the data: `POST` or `GET`. 
    * The `POST` method should always be used if the data is going to result in a change to the server's database, because this can be made more resistant to cross-site forgery request attacks.
    * The `GET` method should only be used for forms that don't change user data (e.g. a search form). It is recommended for when you want to be able to bookmark or share the URL.
