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

hostname = node['var']['hostname']
bash "change hostname" do
  user "root"
  code <<-EOS
    hostname #{hostname}
  EOS
end