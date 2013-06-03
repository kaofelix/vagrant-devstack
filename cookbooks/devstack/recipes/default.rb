#
# Cookbook Name:: devstack
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'git'

git '/opt/devstack' do
  repository "https://github.com/openstack-dev/devstack.git"
  reference "master"
end

template "/opt/devstack/localrc"

execute "stack.sh" do
  command "./stack.sh > /var/log/devstack.log"
  cwd "/opt/devstack"
end
