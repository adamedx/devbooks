#
# Cookbook Name:: regtest
# Recipe:: default
#
# Copyright 2013, ChefConf
#
# All rights reserved - Do Not Redistribute
#


powershell "ExecutionPolicyAtLeastRemoteSigned" do
  architecture :x86_64
  code <<-EOH
  set-executionpolicy unrestricted
  EOH
  values = registry_get_values("HKLM\\SOFTWARE\\Microsoft\\PowerShell\\1\\ShellIds\\Microsoft.PowerShell")
  policy = nil
  values.each do |value|
    policy ||= value[:data] if value[:name] == 'ExecutionPolicy'
  end
  
  only_if {policy == 'AllSigned' || policy == 'Restricted'} 
end

powershell "ExecutionPolicyAtLeastRemoteSignedX86" do
  architecture :i386
  code <<-EOH
  set-executionpolicy unrestricted
  EOH

  values = registry_get_values("HKLM\\SOFTWARE\\Microsoft\\PowerShell\\1\\ShellIds\\Microsoft.PowerShell", :i386)
  policy = nil
  values.each do |value|
    policy ||= value[:data] if value[:name] == 'ExecutionPolicy'
  end

  only_if {policy == 'AllSigned' || policy == 'Restricted'} 
end

