#
# Cookbook Name:: init
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# /etc/sysconfig/network
template "/etc/sysconfig/network" do
  path "/etc/sysconfig/network"
  mode "0644"
  owner "root"
  group "root"
end

hostname = node['var']['hostname'] # Please keep in pre-defined by the nodes file.
bash "change hostname" do
  user "root"
  code <<-EOS
    hostname #{hostname}
  EOS
end

# commands and tools
%w{
  git-all
  htop
  tree
  }.each do |pkg|
  package pkg do
    action :install
  end
end