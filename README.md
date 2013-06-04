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


Running CloudCAFE Tests
-----------------------

It's recommended to make a virtualenv to install CloudCAFE and it's
dependencies in. After you create and activate the virtualenv, you
need to install some dependencies:

    pip install IPy decorator paramiko pymongo requests unittest2

Then you need to clone the following projects:

* [OpenCAFE](https://github.com/stackforge/opencafe) 
* [CloudCAFE](https://github.com/stackforge/cloudcafe)
* [Cloudroast](https://github.com/stackforge/cloudroast)

On each project directory, run

    pip install . -U

You can use the provided `devstack.json.config.example` file to run
your tests. The only thing you need to set is your primary image id,
that you can easily find on the file searching for
`PUT_YOUR_IMAGE_ID_HERE`. Replace the placeholder by a valid image id
for you devstack.

## Getting an image id

* With your vagrant box up, visit http://192.168.11.22 in your
  browser. You should see the login page for the OpenStack Dashboard. 
* Login as admin using `admin` and `password` as your username and
  password.
* Go to the Images link on the left navbar.
* Click on the cirros-0.3.1-x86_64-uec image.
* Copy the value under *ID*. It should look similar to
  `66bf4aaf-67cf-4d43-964b-a5cd3dabeab1`

## Running CloudCAFE tests

Save the config file with the right image value to
`~/.cloudcafe/configs/compute/devstack.json.config` and you should be
able to run tests, e.g.:

    cafe-runner compute devstack.json.config -m test_create_images
