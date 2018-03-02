# HTML, CSS and JavaScript

Websites can be roughly divided into two parts, the **browser** and the **server**.

We are all familiar with web browsers, you are using one right now! There are a number of popular ones, such as Chrome, Firefox and Internet Explorer.

All web browsers handle the four fundamental technologies of the web. We've already seen the first, HTTP, which handles delivering content to the browser. The remaining three are covered in this lesson.

# HTML

A **HyperText Markup Language** (or **HTML**) file containing most of the text content of a web page and has a `.html` extension. The text is wrapped in **tags** to give them meaning. A snippet of HTML might look like this:

```html
<blockquote>
  Nerds like us are allowed to be unironically enthusiastic about stuff. Nerds are allowed to love stuff - like, jump-up-and-down-in-your-chair-can't-control-yourself love it. When people call other people nerds, mostly what they're saying is "You like stuff", which is not a good insult at all. Like, "You are too enthusiastic about the miracle of human consciousness".
</blockquote>

<div class="cite">John Green</div>
```

And when the browser **renders** the HTML it looks like this:

> DEV: Add a webpage snippet for the HTML code snippet above

Feel free to change the HTML above and refresh the viewer (by clicking the blue icon) to see how it changes!

# CSS

**Cascading Style Sheets** (or **CSS**) give the browser styling hints for the HTML. They have a `.css` extension. Every website has CSS, because HTML looks absolutely terrible without it.

For the quote above we can do a stylesheet like this:

```css
blockquote {
  background-color: black;
  color: yellow;
  padding: 10px;
}

.cite {
  text-align: right;
  font-weight: bold;
  font-size: x-large;
}
```

Each section in the stylesheet applies to a different set of tags in the HTML. The first section applies to any `blockquote` tags. The second section applies to any tags which have the attribute ``class="cite"`` as part of their name (like the second tag in the example).

When applied, this "styles" the quote to look like this:

> DEV: Add a webpage snippet for the HTML and CSS above

If you make a change to the CSS above, it will be displayed in the viewer above.


# JavaScript

**JavaScript** (sometimes called **JS**) is an entire programming language contained entirely within the browser. Though HTML with CSS might look pretty, it can't actually do anything once the page has been rendered.

This snippet of JavaScript will run in your browser and scan the current page for `blockquote` tags and give them a random color every 200 milliseconds (five times per second).

```javascript
function partypartyparty() {
    var quotes = document.getElementsByClassName('fancyquote');
    for(var i=0; i<quotes.length; i++) {
        var r = Math.floor(Math.random()*255);
        var g = Math.floor(Math.random()*255);
        var b = Math.floor(Math.random()*255);
        var q = quotes[i];
        q.style.setProperty('color', 'rgb('+ r +','+ g +',' + b + ')');
    }
}

window.setInterval(partypartyparty, 500);
```

If you add it to the page then the result is, well, startling:

> DEV: another webpage snippet for the HTML / CSS / JS above

Try changing the numbers 255 to a different value to see what happens!
