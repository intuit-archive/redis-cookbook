user = node['redis']['user']
group = node['redis']['group']

user user do
  comment "I run redis"
  shell "/bin/bash"
end

package "intu-redis" do
  version "#{node['redis']['version']}"
end

directory "/var/run/redis" do
  owner user
  group group
  mode 0755
end

directory "/etc/redis" do
  owner user
  group group
  mode 0755
end

directory "/var/lib/redis" do
  owner user
  group group
  mode 0755
end

directory "/var/lib/redis" do
  owner user
  group group
  mode 0755
end

template "/etc/init.d/redis" do
  source "redis.erb"
  owner "root"
  group "root"
  mode "0755"
  variables :redis_path     => node['redis']['path'],
            :redis_pidfile  => node['redis']['pidfile'],
            :redis_user     => node['redis']['user'],
            :redis_conf     => node['redis']['conf']

end

cookbook_file "/etc/redis/redis.conf" do
  mode "0644"
  owner user
  group group
end

service "redis" do
  supports :restart => true
  action [:enable, :start]
end
