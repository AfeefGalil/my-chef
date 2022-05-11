#!/bin/bash

echo "chef_repo_path '/home/ubuntu/my-chef/afeef_petclinic'" > solo.rb
echo "cookbook_path '/home/ubuntu/my-chef/afeef_petclinic/site_cookbooks'" >> solo.rb
echo "role_path 'cookbooks/petclinic/roles'" >> solo.rb