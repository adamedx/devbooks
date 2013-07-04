Domain Cookbook
======================
Enables management of membership to an Active Directory domain through an LWRP.

e.g.Requirements
------------
This cookbook currently applies only to the Windows platform.

Attributes
----------
#### Domain::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['domain_member']['domain']</tt></td>
    <td>String</td>
    <td>DNS name of the Active Directory domain</td>
    <td><tt>mydomain</tt></td>
  </tr>
</table>

Usage
-----
#### domain::member

Include `domain` in your node's `run_list` and provide a value for the
`'domain'` attribute.

```json
{
  "domain":"my_domain",
  "run_list": [
    "recipe[domain::member]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

|                      |                                          |
|:---------------------|:-----------------------------------------|
| **Author:**          | Adam Edwards
| **Copyright:**       | Copyright (c) 2013 Adam Edwards
| **License:**         | Apache License, Version 2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

