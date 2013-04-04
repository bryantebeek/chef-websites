#
# Cookbook Name:: websites
# Recipe:: default
#
# Copyright 2013, Bryan te Beek
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Configure websites
sites = node["sites"] ||= []

sites.each do |name|
  site = data_bag_item("sites", name)

  puts "Installing site #{site["id"]}"

  # Add site to apache config
  web_app site["host"] do
    template "website.conf.erb"
    server_name site["host"]
    server_aliases site["aliases"]
    docroot site["docroot"]
  end

  # Add site info in /etc/hosts
  bash "hosts" do
    aliases = site["aliases"].join(' ') if site["aliases"].kind_of?(Array)
    code "echo 127.0.0.1 #{site["host"]} #{aliases} >> /etc/hosts"
  end
end

# Control default site (default is false)
apache_site "default" do
  enable node['websites']['default']
end
