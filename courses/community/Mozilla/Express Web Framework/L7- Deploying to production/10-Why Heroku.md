Heroku is one of the longest running and popular cloud-based PaaS services. It originally supported only Ruby apps, but now can be used to host apps from many programming environments, including Node (and hence Express)!

We are choosing to use Heroku for several reasons:

* Heroku has a free tier that is really free (albeit with some limitations).
* As a PaaS, Heroku takes care of a lot of the web infrastructure for us. This makes it much easier to get started, because you don't worry about servers, load balancers, reverse proxies, restarting your website on a crash, or any of the other web infrastructure that Heroku provides for us under the hood.
* While it does have some limitations, these will not affect this particular application. For example: 
    * Heroku provides only short-lived storage so user-uploaded files cannot safely be stored on Heroku itself.
    * The free tier will sleep an inactive web app if there are no requests within a half hour period. The site may then take several seconds to respond when it is woken up.
    * The free tier limits the time that your site is running to a certain amount of hours every month (not including the time that the site is "asleep"). This is fine for a low use/demonstration site, but will not be suitable if 100% uptime is required.
    * Other limitations are listed in Limits (Heroku docs).
* Mostly it just works, and if you end up loving it and want to upgrade, scaling your app is very easy.

While Heroku is perfect for hosting this demonstration it may not be perfect for your real website. Heroku makes things easy to set up and scale, at the cost of being less flexible, and potentially a lot more expensive once you get out of the free tier.
