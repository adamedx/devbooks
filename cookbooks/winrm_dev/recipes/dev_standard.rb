#
# Cookbook Name:: winrm_dev
# Recipe:: dev_standard
#
# Copyright 2013, Adam Edwards
#
# All rights reserved - Do Not Redistribute
#x

powershell_script "standard_winrm_security" do
  code <<-EOH
  if ((gi wsman:/localhost/client/auth/basic).value -ne $false)
  {
    si wsman:/localhost/client/auth/basic $false
  }
  if ((gi wsman:/localhost/service/auth/basic).value -ne $false)
  {
    si wsman:/localhost/service/auth/basic $false
  }
  if ((gi wsman:/localhost/MaxTimeoutMs).value -ne 180000)
  {
    si wsman:/localhost/MaxTimeoutMs 180000
  }
  if ((gi wsman:/localhost/Service/AllowUnencrypted).value -ne $false)
  {
    si wsman:/localhost/service/AllowUnencrypted $false
  }
  EOH
end


