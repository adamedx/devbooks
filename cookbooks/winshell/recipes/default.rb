#
# Cookbook Name:: winshell
# Recipe:: default
#
# Copyright 2013, Opscode, Inc.
#
# All rights reserved - Do Not Redistribute
#

# It's not fair that Windows users have to include a "special" Windows cookbook
# just to use basic resources like scripting that all the Unix users get without
# the extra cookbooks. It's bad enough we have to use cmd.exe...
#
batch "run_whoami_batch" do
  code <<-EOH
  whoami > c:\\whoami_batch.txt
  EOH
end

# Let's run powershell as well:
powershell "powershell_x86" do
  architecture :i386
  cwd 'c:/windows'
  code <<-EOH
  echo \"I am powershell: $env:PROCESSOR_ARCHITECTURE\" > c:\\arch_ps.txt
  echo \"I am supposed to be x86\" >> c:\\arch_ps.txt
  pwd >> c:\\arch_ps.txt
  notepad c:\\arch_ps.txt
  EOH
end



# Windows does some more "special" things when a process runs as 32-bit vs.
# 64-bit -- it's nice to be able to easily discover and control that:

# Sometimes we feel 32-bit:
batch "batch_x86" do
  architecture :i386
  cwd 'C:/windows'
  code <<-EOH
  echo I am an %PROCESSOR_ARCHITECTURE% script. > c:\\arch.txt
  echo I am supposed to be x86 >> c:\\arch.txt
  cd >> c:\\arch.txt
  notepad c:\\arch.txt
  EOH
end

# And sometimes we don't -- use implicit x64:
batch "batch_x64" do
  cwd 'c:/windows'
  code <<-EOH
  echo I am an %PROCESSOR_ARCHITECTURE% script. > c:\\arch2.txt
  echo I am supposed to be x64 >> c:\\arch2.txt 
  cd >> c:\\arch2.txt
  notepad c:\\arch2.txt  
  EOH
end

# Let's run powershell as well with explicit x64:
powershell "powershell_x64" do
  architecture :x86_64
  cwd 'c:/chef'
  code <<-EOH
  echo \"I am powershell x64: $env:PROCESSOR_ARCHITECTURE\" > c:\\arch_ps_x64.txt
  echo \"I am supposed to be x64\" >> c:\\arch_ps_x64.txt
  pwd >> c:\\arch_ps_x64.txt
  notepad c:\\arch_ps_x64.txt
  EOH
end



