user = node['redis']['user']
group = node['redis']['group']

user user do
  comment "I run redis"
  shell "/bin/bash"
end

package "intu-redis" do
  version "#{node['redis']['version']}-1"
end

directory "/var/run/redis" do
  owner user
  group group
  mode 0755
  action :create
end

directory "/var/lib/redis" do
  owner user
  group group
  mode 0755
  action :create
end

directory "/var/lib/redis/6379" do
  owner user
  group group
  mode 0755
  action :create
end

cookbook_file "/etc/init.d/redis_6379" do
  source "redis_6379.erb"
  mode "0755"
  owner "root"
  group "root"
  variables :redis_path     => node['redis']['path'],
            :redis_pidfile  => node['redis']['pidfile'],
            :redis_conf     => node['redis']['conf']

end

template "/etc/redis/6379.conf" do
  mode "0644"
  owner user
  group group
end

service "redis_6379" do
  supports :restart => true
  action [:enable, :start]
end
