Vagrant Devstack
================

This repo contains a `Vagrantfile` and a chef recipe to setup a
[devstack](http://devstack.org) VM. It uses
[Berkshelf](http://berkshelf.com) to manage chef cookbooks.

In order to use it:

* [Install vagrant](http://docs.vagrantup.com/v2/getting-started/index.html)
  and [Virtual Box](https://www.virtualbox.org/wiki/Downloads)
* Install berkshelf: `gem install berkshelf`
* Install the berkshelf plugin for Vagrant: `vagrant plugin install vagrant-berkshelf`
* Clone this repo, `cd` to it, and `vagrant up`

The devstack chef recipe runs `stack.sh > /var/log/devstack.log`, so
you can `vagrant ssh` and `tail -f /var/log/devstack.log` to check
progress of the devstack installation.
