#
# Cookbook Name:: winrm_dev
# Recipe:: debugging_only
#
# Copyright 2013, Adam Edwards
#
# All rights reserved - Do Not Redistribute
#

powershell_script "low_security_winrm_debug_only" do
  code <<-EOH
  if ((gi wsman:/localhost/client/auth/basic).value -ne $true)
  {
    si wsman:/localhost/client/auth/basic $true
  }
  if ((gi wsman:/localhost/service/auth/basic).value -ne $true)
  {
    si wsman:/localhost/service/auth/basic $true
  }
  if ((gi wsman:/localhost/MaxTimeoutMs).value -ne 180000)
  {
    si wsman:/localhost/MaxTimeoutMs 180000
  }
  if ((gi wsman:/localhost/Service/AllowUnencrypted).value -ne $true)
  {
    si wsman:/localhost/service/AllowUnencrypted $true
  }
  EOH
end

