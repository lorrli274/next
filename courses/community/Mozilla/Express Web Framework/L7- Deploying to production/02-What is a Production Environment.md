The **production environment** is the environment provided by the server computer where you will run your website for external consumption. The environment includes:

* Computer hardware on which the website runs.
* Operating system (e.g. Linux or Windows).
* Programming language runtime and framework libraries on top of which your website is written.
* Web server infrastructure, possibly incuding a web server, reverse proxy, load balancer, etc.
* Databases on which your website is dependent.

The server computer could be located on your premises and connected to the Internet by a fast link, but it is far more common to use a computer that is hosted "in the cloud". What this actually means is that your code is run on some remote computer (or possibly a "virtual" computer) in your hosting company's data center(s). The remote server will usually offer some guaranteed level of computing resources (e.g. CPU, RAM, storage memory, etc.) and Internet connectivity for a certain price.

This sort of remotely accessible computing/networking hardware is referred to as **Infrastructure as a Service** (IaaS). Many IaaS vendors provide options to preinstall a particular operating system, onto which you must install the other components of your production environment. Other vendors allow you to select more fully-featured environments, perhaps including a complete Node setup.

Info>Pre-built environments can make setting up your website very easy because they reduce the configuration, but the available options may limit you to an unfamiliar server (or other components) and may be based on an older version of the OS. Often it is better to install components yourself, so that you get the ones that you want, and when you need to upgrade parts of the system, you have some idea of where to start!

Other hosting providers support Express as part of a **Platform as a Service** (PaaS) offering. When using this sort of hosting you don't need to worry about most of your production environment (servers, load balancers, etc.) as the host platform takes care of those for you. That makes deployment quite easy, because you just need to concentrate on your web application and not any other server infrastructure.

Some developers will choose the increased flexibility provided by IaaS over PaaS, while others will appreciate the reduced maintenance overhead and easier scaling of PaaS. When you're getting started, setting up your website on a PaaS system is much easier, so that is what we'll do in this tutorial.

Info>If you choose a Node/Express-friendly hosting provider they should provide instructions on how to set up an Express website using different configurations of webserver, application server, reverse proxy, etc. For example, there are many step-by-step guides for various configurations in the Digital Ocean Node community docs.
