Run the application, open your browser to http://localhost:3000/ , then select the _Create new author_ link. If everything is set up correctly, your site should look something like the following screenshot. After you enter a value, it should be saved and you'll be taken to the author detail page.

![](https://storage.googleapis.com/codevolve-assets/internal/courses/Mozilla/Mozilla%20Author.png)

If you experiment with various input formats for the dates, you may find that the format `yyyy-mm-dd` misbehaves. This is because JavaScript treats date strings as including the time of 0 hours, but additionally treats date strings in that format (the ISO 8601 standard) as including the time 0 hours UTC, rather than the local time. If your time zone is west of UTC, the date display, being local, will be one day before the date you entered. This is one of several complexities (such as multi-word family names and multi-author books) that we are not addressing here.
