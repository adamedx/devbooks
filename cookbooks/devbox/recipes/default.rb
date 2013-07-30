#
# Cookbook Name:: devbox
# Recipe:: default
#
# Copyright 2013, Adam Edwards
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'
include_recipe 'chocolatey'
include_recipe 'winrm_dev'

if node[:platform] == "windows"
  include_recipe 'devbox::powershell_dev'
  chocolatey "emacs"
else
  package "emacs" do
    action :install
  end

  package "build-essential" do
    action :install
  end
end
