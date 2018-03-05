Now that we understand something of what Mongoose can do and how we want to design our models, it's time to start work on the _LocalLibrary_ website. The very first thing we want to do is set up a MongoDb database that we can use to store our library data.

For this tutorial we're going to use mLab's free cloud-hosted "sandbox" database. This database tier is not considered suitable for production websites because it has no redundancy, but it is great for development and prototyping. We're using it here because it is free and easy to set up, and because mLab is a popular _database as a service_ vendor that you might reasonably choose for your production database (other popular choices at the time of writing include Compose, ScaleGrid and MongoDB Atlas).

If you prefer you can set up a MongoDb database locally by downloading and installing the appropriate binaries for your system. The rest of the instructions in this article would be similar, except for the database URL you would specify when connecting.

You will first need to create an account with mLab (this is free, and just requires that you enter basic contact details and acknowledge their terms of service). 

After logging in, you'll be taken to the home screen:

1. Click **Create New** in the _MongoDB Deployments_ section.
2. This will open the _Cloud Provider Selection _screen.  

>DEV: Add image below
  
    * Select the SANDBOX (Free) plan from the Plan Type section. 
    * Select any provider from the _Cloud Provider _section. Different providers offer different regions (displayed below the selected plan type).
    * Click the **Continue** button.
3. This will open the _Select Region_ screen. 

>DEV: Add image below

4. This will open the _Final Details_ screen.  

>DEV: Add image below

5. This will open the _Order Confirmation_ screen.  

>DEV: Add image below

6. You will be returned to the home screen. Click on the new database you just created to open its details screen. As you can see the database has no collections (data).  

>DEV: Add image below
   
The URL that you need to use to access your database is displayed on the form above (shown for this database circled above). In order to use this you need to create a database user that you can specify in the URL.

7. Click the **Users** tab and select the **Add database user** button.
8. Enter a username and password (twice), and then press **Create**. Do not select _Make read only_.  

>DEV: Add image below

You now have now created the database, and have an URL (with username and password) that can be used to access it. This will look something like: `mongodb://your_user_namer:your_password@ds119748.mlab.com:19748/local_library`.
