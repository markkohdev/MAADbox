#
# Cookbook Name:: maadbox
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

group 'vagrant'

user 'vagrant' do
	group 'vagrant'
	system true
	shell '/bin/bash'
end

# mysql_service 'vagrant' do
#   port '3306'
#   version '5.5'
#   initial_root_password 'root'
#   action [:create, :start]
# end

include_recipe 'apt'
include_recipe 'mysql::client'
include_recipe 'mysql::server'
include_recipe 'apache2'
include_recipe 'git'
include_recipe 'python'
include_recipe 'ruby'
include_recipe 'nodejs'
