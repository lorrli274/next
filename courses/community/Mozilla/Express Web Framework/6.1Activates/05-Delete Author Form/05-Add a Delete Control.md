Next we will add a **Delete control** to the Author detail view (the detail page is a good place from which to delete a record).

info> In a full implementation the control would be made visible only to authorised users. However at this point we haven't got an authorisation system in place!

Open the *author_detail.pug* view and add the following lines at the bottom.
    
```js    
hr
p
  a(href=author.url+'/delete') Delete author
```

The control should now appear as a link, as shown below on the Author detail page.

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Mozilla/LocalLibary_Express_Author_Detail_Delete.png)
