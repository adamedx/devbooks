winrm_dev Cookbook
==================
Manages winrm configuration for development purposes

Requirements
------------
This cookbook only applies to the Windows platform.

e.g.
#### packages
- `PowerShelltoaster` - winrm_dev require PowerShell to be installed on the system

Attributes
----------

Usage
-----
#### winrm_dev::default
Performs a winrm quickconfig

#### winrm_dev::all_network_scopes
Configures the Windows firewall to allow winrm requests originating from all subnets, not just the local
subnet.

#### winrm_dev::dev_standard
Enables access from all subnets with standard Windows security defaults

#### winrm_dev::debugging_only
Enables access from all subnets and allows basic authentication without
encryption for testing and debugging purposes only This is an insecure
configuration for the system that should only be used on a temporary,
as-needed basis.

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


