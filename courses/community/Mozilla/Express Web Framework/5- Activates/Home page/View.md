Open **/views/index.pug** and replace its content with the text below.
    
    
    extends layout
    
    block content
      h1= title
      p Welcome to #[em LocalLibrary], a very basic Express website developed as a tutorial example on the Mozilla Developer Network.
    
      h1 Dynamic content
    
      if error
        p Error getting dynamic content.
      else
        p The library has the following record counts:
    
        ul
          li #[strong Books:] !{data.book_count}
          li #[strong Copies:] !{data.book_instance_count}
          li #[strong Copies available:] !{data.book_instance_available_count} 
          li #[strong Authors:] !{data.author_count}
          li #[strong Genres:] !{data.genre_count}

The view is straightforward. We extend the **layout.pug** base template, overriding the `block` named '**content**'. The first `h1` heading will be the escaped text for the `title` variable that was passed into the `render()` function—note the use of the '`h1=`' so that the following text is treated as a JavaScript expression. We then include a paragraph introducing the LocalLibrary.

Under the _Dynamic content_ heading we check whether the error variable passed in from the `render()` function has been defined. If so, we note the error. If not, we get and list the number of copies of each model from the `data` variable.

**Note:** We didn't escape the count values (i.e. we used the `!{}` syntax) because the count values are calculated. If the information was supplied by end-users then we'd escape the variable for display.

## What does it look like?

At this point we should have created everything needed to display the index page. Run the application and open your browser to . If everything is set up correctly, your site should look something like the following screenshot.

![Home page - Express Local Library site][5]

**Note:** You won't be able to use the sidebar links yet because the urls, views, and templates for those pages haven't been defined. If you try you'll get errors like "NOT IMPLEMENTED: Book list" for example, depending on the link you click on.  These string literals (which will be replaced with proper data) were specified in the different controllers that live inside your "controllers" file.
