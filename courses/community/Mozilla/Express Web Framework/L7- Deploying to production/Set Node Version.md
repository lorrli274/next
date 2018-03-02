The **Package.json** contains everything needed to work out your application dependencies and what file should be launched to start your site. Heroku detects the presence of this file, and will use it to provision your app environment.

The only useful information missing in our current **Package.json** is the version of node. We can find the version of node we're using for development by entering the command:
    
```js    
>node --version
v8.9.1
```

Open **Package.json**, and add this information as an **engines > node** section as shown (using the version number for your system).
    
```js    
{
  "name": "express-locallibrary-tutorial",
  "version": "0.0.0",
**  "engines": {
    "node": "8.9.1"
  },**
  "private": true,
  ...
```    
