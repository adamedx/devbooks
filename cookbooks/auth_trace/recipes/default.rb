#
# Cookbook Name:: auth_trace
# Recipe:: default
#
# Copyright 2013, Adam Edwards
#
# All rights reserved - Do Not Redistribute
#

remote_directory "ssptraces" do
  path "#{ENV['systemdrive']}/#{name}"
  source "#{name}"
end

test_directory = "authtests"

directory "#{ENV['systemdrive']}/#{test_directory}" do
end

cookbook_file "authtests/authtest.ps1" do
  path "#{ENV['systemdrive']}/#{name}" 
end

cookbook_file "authtests/clienttestwinrs.ps1" do
  path "#{ENV['systemdrive']}/#{name}"
end

cookbook_file "#{test_directory}/clienttestknife.ps1" do
  path "#{ENV['systemdrive']}/#{name}"
end

cookbook_file "authtests/servertest.ps1" do
  path "#{ENV['systemdrive']}/#{name}"
end

cookbook_file "#{test_directory}/copytraces.ps1" do
  path "#{ENV['systemdrive']}/#{name}"
end

cookbook_file "#{test_directory}/cleantraces.ps1" do
  path "#{ENV['systemdrive']}/#{name}"
end

chef_gem "knife-windows" do
end

