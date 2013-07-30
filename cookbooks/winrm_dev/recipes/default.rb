#
# Cookbook Name:: winrm_dev
# Recipe:: default
#
# Copyright 2013, Adam Edwards
#
# All rights reserved - Do Not Redistribute
#
powershell_script "enable_winrm" do
  code "winrm quickconfig"
end

execute "winrm_firewall" do
  command "netsh advfirewall firewall add rule \"WinRM HTTP\" protocol=TCP dir=in Localport=5985 remoteport=5985 action=allow localip=any remoteip=any profile=public enable=yes"
end

execute "winrm_firewall" do
  command "netsh advfirewall firewall add rule \"WinRM HTTPS\" protocol=TCP dir=in Localport=5986 remoteport=5986 action=allow localip=any remoteip=any profile=public enable=yes"
end

