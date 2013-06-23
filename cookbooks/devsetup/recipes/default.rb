#
# Cookbook Name:: devsetup
# Recipe:: default
#
# Copyright 2013, Opscode, Inc.
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'git'

package "emacs" do
  action :install
end
