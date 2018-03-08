Across a site, it is usual for all pages to have a common structure, including standard HTML markup for the head, footer, navigation, etc. Rather than forcing developers to duplicate this "boilerplate" in every page, Pug allows you to declare a **base template** and then **extend** it, replacing just the bits that are different for each specific page.

For example, the base template layout.pug created in our skeleton project looks like this:
    
```js    
doctype html
html
  head
    title= title
    link(rel='stylesheet', href='https://developer.mozilla.org/stylesheets/style.css')
  body
    block content
```

The `block` tag is used to mark up sections of content that may be replaced in a derived template (if the block is not redefined then its implementation in the base class is used).

The default index.pug (created for our skeleton project) shows how we override the base template. The `extends` tag identifies the base template to use, and then we use `block _section_name_` to indicate the new content of the section that we will override.
    
```js    
extends layout

block content
  h1= title
  p Welcome to #{title}
```
