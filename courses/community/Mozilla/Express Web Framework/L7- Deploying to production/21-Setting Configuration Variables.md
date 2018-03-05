You will recall from a preceding section that we need to set NODE_ENV to 'production' in order to improve our performance and generate less-verbose error messages. We do this by entering the following command:
    
```js    
>heroku config:set NODE_ENV='production'
Setting NODE_ENV and restarting limitless-tor-18923... done, v13
NODE_ENV: production
 ```   

We should also use a separate database for production, setting its URI in the **MONGODB_URI**  environment variable. You can set up a new database and database-user exactly as we did originally, and get its URI. You can set the URI as shown (obviously, using your own URI!)
    
```js    
>heroku config:set **MONGODB_URI**='mongodb://your_user:your_password@ds139278.mlab.com:39278/local_library_production'
Setting MONGODB_URI and restarting limitless-tor-18923... done, v13
MONGODB_URI: mongodb://your_user:your_password@ds139278.mlab.com:39278/local_library_production
 ```   

You can inspect your configuration variables at any time using the `heroku config` command — try this now:
    
```js    
>heroku config
=== limitless-tor-18923 Config Vars
MONGODB_URI: mongodb://your_user:your_password@ds139278.mlab.com:39278/local_library_production
NODE_ENV:    production
```    

Heroku will restart your app when it updates the variables. If you check the home page now it should show zero values for your object counts, as the changes above mean that we're now using a new (empty) database.
