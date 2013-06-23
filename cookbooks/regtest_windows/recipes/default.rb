#
# Cookbook Name:: regtest
# Recipe:: default
#
# Copyright 2013, ChefConf
#
# All rights reserved - Do Not Redistribute
#

powershell "ExecutionPolicy" do
  code <<-EOH
  try
  {
     set-executionpolicy -force unrestricted
  }
  catch
  {
  }
  exit 0
  EOH
end

