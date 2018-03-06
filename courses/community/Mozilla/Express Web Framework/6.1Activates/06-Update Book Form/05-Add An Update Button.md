Open the **book_detail.pug** view and make sure there are links for both deleting and updating books at the bottom of the page, as shown below.
    
    
      hr
      p
        a(href=book.url+'/delete') Delete Book
      p
        a(href=book.url+'/update') Update Book

You should now be able to update books from the _Book detail_ page.
