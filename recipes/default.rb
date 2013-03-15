user = node['redis']['user']
group = node['redis']['group']
dirs = [ "/var/run/redis", "/var/log/redis", "/var/lib/redis", "/etc/redis" ]
 
user user do
  comment "I run redis"
  shell "/bin/bash"
end

package "intu-redis" do
  version "#{node['redis']['version']}"
end

dirs.each do |dir|
  directory dir do
    owner user
    group group
    mode "0755"
  end
end

template "/etc/init.d/redis" do
  source "redis_init.erb"
  owner "root"
  group "root"
  mode "0755"
  variables :redis_path     => node['redis']['path'],
            :redis_pidfile  => node['redis']['pidfile'],
            :redis_user     => node['redis']['user'],
            :redis_port     => node['redis']['port'],
            :redis_conf     => node['redis']['conf']

end

template "/etc/redis/redis.conf" do
  source "redis_conf.erb"
  mode "0644"
  owner user
  group group
  variables :redis_port     => node['redis']['port']

end

service "redis" do
  supports :restart => true
  action [:enable, :start]
end
