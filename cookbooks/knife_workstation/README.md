knife_workstation Cookbook
==========================
This cookbook sets up useful gems for your knife workstation

Requirements
------------
This cookbook requires the windows cookbook in order to support Windows.


#### packages

Attributes
----------

Usage
-----
#### knife_workstation::default
Sets up useful default gems and generic tools

Just include `knife_workstation` in your node's `run_list`:
```json
{
  "name":"my_node",
  "run_list": [
    "recipe[knife_workstation]"
  ]
}
```

License and Authors
-------------------
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

