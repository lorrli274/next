The first page we'll create will be the website home page, which is accessible from either the site (`'/'`) or catalog (`catalog/`) root. This will display some static text describing the site, along with dynamically calculated "counts" of different record types in the database.

We've already created a route for the home page. In order to complete the page we need to update our controller function to fetch "counts" of records from the database, and create a view (template) that we can use to render the page.
