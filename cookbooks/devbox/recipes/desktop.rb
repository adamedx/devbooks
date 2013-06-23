#
# Cookbook Name:: devbox
# Recipe:: desktop
#
# Copyright 2013, Adam Edwards
#
# All rights reserved - Do Not Redistribute
#

if node[:platform] != "windows"
  package "xrdp" do
    action :install
  end

  package "firefox" do
    action :install
  end
end
