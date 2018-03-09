danger> http://localhost:3000/ needs to work in codevolve?

Run the application and open your browser to http://localhost:3000/. Then select the All authors link, and then select a particular author. Finally select the Delete author link.

If the author has no books, you'll be presented with a page like this. After pressing delete, the server will delete the author and redirect to the author list.

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Mozilla/LocalLibary_Express_Author_Delete_NoBooks.png)

If the author does have books, then you'll be presented with a view like the following. You can then delete the books from their detail pages (once that code is implemented!).

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Mozilla/LocalLibary_Express_Author_Delete_WithBooks.png)

info> The other pages for deleting objects can be implemented in much the same way. We've left that as a challenge.
