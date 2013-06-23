DevBooks
===============

DevBooks is a random collection of Chef cookbooks that I've used while I
learned Chef and also to set up development tools and environments.

# Prerequisites

To use the cookbooks in this repository, you'll need to learn about Chef:

  https://github.com/opscode/chef
  https://docs.opscode.com

# Installation

To use these cookbooks with knife, Chef's administration tool, clone this repository and
create a .chef subdirectory under the cloned directory with the knife
workstation configuration for your Chef server:

    git clone git@github.com:adamedx/devbooks
    
# Usage

Upload any of the cookbooks via knife to your Chef server to use them to manage nodes. Note that while
some of them have been developed as serious cookbooks, others were simply used
to learn a concept or reproduce a bug, and therefore may only work on one of
my systems, not yours. :)

# License #

Copyright:: Copyright (c) 2011-2013 Adam Edwards

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
