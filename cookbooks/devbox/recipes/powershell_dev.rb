#
# Cookbook Name:: devbox
# Recipe:: powershell_dev
#
# Copyright 2013, Adam Edwards
#
# All rights reserved - Do Not Redistribute
#

powershell_script "ExecutionPolicyAtLeastRemoteSigned" do
  architecture :x86_64
  code <<-EOH
    $ep = get-executionpolicy
    if ($ep -eq "allsigned" -or $ep -eq "restricted" ) { set-executionpolicy remotesigned -force -scope localmachine}
  EOH
end

powershell_script "ExecutionPolicyAtLeastRemoteSignedX86" do
  architecture :i386
  code <<-EOH
    $ep = get-executionpolicy
    if ($ep -eq "allsigned" -or $ep -eq "restricted" ) { set-executionpolicy remotesigned -force -scope localmachine}
  EOH
end
