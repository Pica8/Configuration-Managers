#
# Cookbook Name:: configure-manager
# Recipe:: default
#
# Copyright 2015, Pica8 Ltd
#
# All rights reserved - Do Not Redistribute
#

directory "#{node['configure-manager']['dir']}/" do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
  action :create
end

cookbook_file "#{node['configure-manager']['dir']}/#{node['configure-manager']['config_file']}" do
  source "#{node['configure-manager']['config_file']}"
  owner 'root'
  group 'root'
  mode '0644'
  notifies :run, 'execute[load_config]', :immediately
end

execute 'load_config' do
  command "/pica/bin/cli -c \"configure;load override #{node['configure-manager']['dir']}/#{node['configure-manager']['config_file']}\""
  action :nothing
end


