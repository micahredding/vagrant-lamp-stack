#Vagrant LAMP Stack

Here we have a default LAMP stack that can be used for development of web applications.

##Get Started

Install [Vagrant](http://vagrantup.com/v1/docs/getting-started/index.html)!

Add Precise Box:

    vagrant box add ubuntu-precise64 http://files.vagrantup.com/precise64.box
    
Install the [vbguest](http://blog.csanchez.org/2012/05/03/automatically-download-and-install-virtualbox-guest-additions-in-vagrant/) plugin:

    vagrant gem install vagrant-vbguest

##Get Going

Simple as this:

    vagrant up
    
##Get a Cup of Coffee

It will take a little bit to set everything up, when it is done you will have a fully configured development enviornment:

- php5.3 + xDebug
- mysql (server pw: "root")
- apache2
- phpunit
- phpcs
- phploc
- phpcpd
- git
- ant

The whole of the project is shared into the `/vagrant` directory, with the `/public` directory being the web root. This fits nicely with frameworks.

##Get Excited

Point your web browser over to `localhost:8080` and checkout your environment!