Now you can imagine how easy it is to **expand** and write more tasks. Export a task in one file and import it in *index.js*. Clean and easy to maintain!

To give you an idea of how to set up your project folder, here's an example setup:   
```    
╔═ build/
╠═ src/
╠═ tasks/
║   ╠═══ config.js => project wide
║   ╠═══ icons.js  => optimize/concat SVG
║   ╠═══ images.js => optimize images
║   ╠═══ index.js  => run tasks
║   ╠═══ misc.js   => copy, delete
║   ╠═══ server.js => start dev server
║   ╠═══ styles.js => CSS + preprocessor
║   ╚═══ webpack.js
╚═ package.json
```
