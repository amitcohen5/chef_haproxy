#
# Cookbook:: amit_haproxy
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#
node.default['haproxy']['members'] = [
  {
  "hostname" => "amitcohen51",
  "ipaddress" => "172.31.117.187",
  "port" => 80,
  "ssl_port" => 80
},{
  "hostname" => "amitcohen52",
  "ipaddress" => "172.31.47.200",
  "port" => 80,
  "ssl_port" => 80
}]

include_recipe "haproxy::manual"

template '/etc/haproxy/haproxy.cfg' do
  source 'haproxy.cfg.erb'
  action :create
end


