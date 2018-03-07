Heroku is closely integrated with the **git** source code version control system, using it to upload/synchronise any changes you make to the live system. It does this by adding a new Heroku "remote" repository named heroku pointing to a repository for your source on the Heroku cloud. During development you use git to store changes on your "master" repository. When you want to deploy your site, you sync your changes to the Heroku repository.

If you're used to following good software development practices you are probably already using git or some other SCM system. If you already have a git repository, then you can skip this step.

There are a lot of ways of to work with git, but one of the easiest is to first set up an account on GitHub, create the repository there, and then sync to it locally:

1. Visit  and create an account.
2. Once you are logged in, click the + link in the top toolbar and select New repository.
3. Fill in all the fields on this form. While these are not compulsory, they are strongly recommended. 
    * Enter a new repository name (e.g. _express-locallibrary-tutorial_), and description (e.g. "Local Library website written in Express (Node)".
    * Choose Node in the Add .gitignore selection list.
    * Choose your preferred license in the Add license selection list.
    * Check Initialize this repository with a README.
4. Press Create repository.
5. Click the green "Clone or download" button on your new repo page.
6. Copy the URL value from the text field inside the dialog box that appears (it should be something like: https://github.com/__/express-locallibrary-tutorial.git).

Now the repository ("repo") is created we are going to want to clone it on our local computer:

1. Install git for your local computer (you can find versions for different platforms here).
2. Open a command prompt/terminal and clone your repository using the URL you copied above: 

```js
git clone https://github.com/**__**/express-locallibrary-tutorial.git
 ```   

This will create the repository below the current point.
3. Navigate into the new repo. 
 
```js
cd express-locallibrary-tutorial
```

The final step is to copy in your application and then add the files to your repo using git:

1. Copy your Express application into this folder (excluding */node_modules*, which contains dependency files that you should fetch from NPM as needed).
2. Open a command prompt/terminal and use the `add` command to add all files to git.

```js
3.     git add -A
```    

4. Use the status command to check all files that you are about to add are correct (you want to include source files, not binaries, temporary files etc.). It should look a bit like the listing below. 

```js
    > git status
On branch master
Your branch is up-to-date with 'origin/master'.
Changes to be committed:
  (use "git reset HEAD ..." to unstage)

        new file:   ...
```

5. When you're satisfied commit the files to your local repository: 

```js
git commit -m "First version of application moved into github"
```

6. Then synchronise your local repository to the Github website, using the following: 

```js
git push origin master
```

When this operation completes, you should be able to go back to the page on Github where you created your repo, refresh the page, and see that your whole application has now been uploaded. You can continue to update your repository as files change using this add/commit/push cycle.

info> This is a good point to make a backup of your "vanilla" project — while some of the changes we're going to be making in the following sections might be useful for deployment on any platform (or development) others might not. The best way to do this is to use _git_ to manage your revisions. With _git_ you can not only go back to a particular old version, but you can maintain this in a separate "branch" from your production changes and cherry-pick any changes to move between production and development branches. Learning Git is well worth the effort, but is beyond the scope of this topic. The easiest way to do this is to just copy your files into another location. Use whichever approach best matches your knowledge of git!

Alright, now it;s time to explains the changes you'll need to make to our LocalLibrary application to get it to work on Heroku.
