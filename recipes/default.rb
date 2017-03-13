#
# Cookbook Name:: chef-inspec
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
chef_gem 'inspec' do
  version node['inspec']['version'] if node['inspec']['version'] != 'latest'
  compile_time true
  clear_sources true if node['inspec']['gem_source']
  source node['inspec']['gem_source'] if node['inspec']['gem_source']
  action :install
end

node['inspec']['profiles'].each do |profile|
  chef_inspec_inspec profile do
    options node['inspec']['options']
    fail_on_error node['inspec']['fail_on_error']
  end
end
