Next we will add a **Delete** control to the_ Author detail_ view (the detail page is a good place from which to delete a record).

**Note:** In a full implementation the control would be made visible only to authorised users. However at this point we haven't got an authorisation system in place!

Open the **author_detail.pug** view and add the following lines at the bottom.
    
    
    hr
    p
      a(href=author.url+'/delete') Delete author

The control should now appear as a link, as shown below on the _Author detail_ page.

Dev add image https://mdn.mozillademos.org/files/14492/LocalLibary_Express_Author_Detail_Delete.png
