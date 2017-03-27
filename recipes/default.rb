#
# Cookbook Name:: chef-inspec
# Recipe:: default
#
chef_gem 'inspec' do
  version node['inspec']['version'] if node['inspec']['version'] != 'latest'
  compile_time true
  clear_sources true if node['inspec']['gem_source']
  source node['inspec']['gem_source'] if node['inspec']['gem_source']
  action :install
end

node['inspec']['profiles'].each do |profile|
  # Dummy resource to run the profiles at the end of the run
  # TODO: surely there is a better way
  chef_inspec_always_run 'run_profiles' do
    notifies :check, "chef_inspec_inspec[#{profile}]", :delayed
  end

  chef_inspec_inspec profile do
    options node['inspec']['options']
    fail_on_error node['inspec']['fail_on_error']

    action :nothing
  end
end
