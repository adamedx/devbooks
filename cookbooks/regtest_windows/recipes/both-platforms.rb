#
# Cookbook Name:: regtest
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

powershell "ExecutionPolicyX86" do
  architecture :i386
  code <<-EOH
  set-executionpolicy unrestricted
  EOH
#  only_if {registry_value_exists?("HKLM\\SOFTWARE\\Microsoft\\PowerShell\\1\\ShellIds\\Microsoft.PowerShell", "ExecutionPolicy") }
  values = registry_get_values("HKLM\\SOFTWARE\\Microsoft\\PowerShell\\1\\ShellIds\\Microsoft.PowerShell", :i386)
  policy = nil
  values.each do |value|
    policy = value[:data] if value[:name] == 'ExecutionPolicy'
  end

  puts "hi: " + policy
  
  only_if {policy == 'AllSigned'} # registry_value_exists?("HKLM\\SOFTWARE\\Microsoft\\PowerShell\\1\\ShellIds\\Microsoft.PowerShell", "ExecutionPolicy") }
end

powershell "ExecutionPolicyX64" do
  architecture :x86_64
  code <<-EOH
  set-executionpolicy unrestricted
  EOH
  values = registry_get_values("HKLM\\SOFTWARE\\Microsoft\\PowerShell\\1\\ShellIds\\Microsoft.PowerShell", :x86_64)
  policy = nil
  values.each do |value|
    policy = value[:data] if value[:name] == 'ExecutionPolicy'
  end

  puts "hi: " + policy
  
  only_if {policy == 'AllSigned'} # registry_value_exists?("HKLM\\SOFTWARE\\Microsoft\\PowerShell\\1\\ShellIds\\Microsoft.PowerShell", "ExecutionPolicy") }
end

