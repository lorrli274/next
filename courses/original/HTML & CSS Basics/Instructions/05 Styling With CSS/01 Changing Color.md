CSS is used to customize the look of HTML documents. You can change things like the size of your text, the color of the background, how round something is, and more! All the CSS changes that gets added make up the **style** of the page.

You may have noticed the extra `<style></style>` tags above `<body>`. That's where CSS goes! CSS needs to be added before body so the browser knows what styles to add before the elements are added to the page.

To write CSS, you should follow this blueprint:
```css
h2 {
  color: red;
}
```

Where the example says `h2` is where you put your **selector**. A selector is the element you want to make a style change to (for example, an `h1` or a `p` tag).

The **property** is the thing about the element you want to change. In the example above, the property is `color`.

Lastly, **value** is what you want to change the property to. The value in the example is `red`.

It's important to use the symbols in the example above. The `{`, `:`, `;`, and `}` are all important to make CSS work properly!