#
# Cookbook Name:: devbox
# Recipe:: default
#
# Copyright 2013, Adam Edwards
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'

if node[:platform] == "windows"
  chocolatey "emacs"
else
  package "emacs" do
    action :install
  end

  package "build-essential" do
    action :install
  end
end
