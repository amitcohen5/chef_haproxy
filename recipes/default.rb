#
# Cookbook:: amit_haproxy
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#


#template '/etc/haproxy/haproxy.cfg' do
#  source 'haproxy.cfg.erb'
#  action :create
#end


all_web_nodes = search('node', 'role:web')

members = []

all_web_nodes.each do |web_node|

  member = {
    'hostname' => web_node['hostname'],
    'ipaddress' => web_node['ipaddress'],
    'port' => 80,
    'ssl_port' => 80
  }
  members.push(member)

end

node.default['haproxy']['incoming_address'] = '*'
node.default['haproxy']['incoming_port'] = '80'
node.default['haproxy']['members'] = members
node.default['haproxy']['enable_admin'] = false

include_recipe "haproxy::manual"


