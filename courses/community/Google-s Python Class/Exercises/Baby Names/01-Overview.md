The Social Security administration has this neat data by year of what names are most popular for babies born that year in the USA. See [social security baby names](http://www.socialsecurity.gov/OACT/babynames/).

The files for this exercise are in the "babynames html files" directory. The files baby1990.html baby1992.html ... contain raw html, similar to what you get visiting the above social security site. Take a look at the html and think about how you might scrape the data out of it.

"""Baby Names exercise

Define the extract_names() function below and change main()
to call it.

For writing regex, it's nice to include a copy of the target
text for inspiration.

Here's what the html looks like in the baby.html files:
```html
...
<h3 align="center">Popularity in 1990</h3>
....
<tr align="right"><td>1</td><td>Michael</td><td>Jessica</td>
<tr align="right"><td>2</td><td>Christopher</td><td>Ashley</td>
<tr align="right"><td>3</td><td>Matthew</td><td>Brittany</td>
...
```
Suggested milestones for incremental development:

 -Extract the year and print it
 
 -Extract the names and rank numbers and just print them
 
 -Get the names data into a dict and print it
 
 -Build the [year, 'name rank', ... ] list and print it
 
 -Fix main() to use the extract_names list
 
"""
