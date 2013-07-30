auth_trace Cookbook
===================
This provides tools for tracing and testing various NTLM / Kerberos
authentication scenarios on with Ruby-based and also Windows native tools on
Windows systems.

The default recipe of this cookbook will create a subdirectory on the system
drive named "ssptraces" containing tools and scripts for enabling / disabling
tracing and collecting data.

Requirements
------------
Requires Ruby and recent versions of Windows Server (2008 R2 or later).

Test systems
------------

The following systems are available for testing:

    138.91.82.179 -- server
    138.91.83.27  -- client

How to collect data
-------------------

Note that there are two systems involved, so you'll need to start the collection on
one system and then start something on another system -- if you're too slow,
the first system will end recording before the second system's scenario
finishes, so be quick! It may be helpful to have commands ready on the CLI so
you can just hit enter to execute...

On the server Machine:

1. On the server system, open powershell and cd \authtests
2. Run the command below -- the argument to the script will make it record
    data for 30s
    
    .\servertest.ps1 30

3. On the client system, execute the following -- it runs knife using a custom
winrm / ntml implementation in Ruby:

    .\clienttestknife.ps1 <ip-address-of-server> administrator 'myadminpassword'

4. The output of both scripts above shows where log file are located -- e.g.
ntlm and kerberos logs are in c:\ssptraces by default. The script output also
shows the OS version and timing of the scenario execution.
5. There is also a script called copytraces.ps1 that will copy ntlm, kerb, and
wsman trace to a directory.
6. A corresponding cleantraces.ps1 will clear those logs.


Attributes
----------

Usage
-----
#### auth_trace::default

Just include `auth_trace` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[auth_trace]"
  ]
}
```

# License #

Copyright:: Copyright (c) 2013 Adam Edwards

License:: Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

