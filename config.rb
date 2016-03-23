template "/tmp/cwlogs.cfg" do
  cookbook "reportServer"
  source "cwlogs.cfg.erb"
  owner "root"
  group "root"
  mode 0644
end

directory "/home/ubuntu/.aws/" do
  mode 0700
  owner 'ubuntu'
  group 'ubuntu'
  action :create
end

template "/home/ubuntu/.aws/config" do
  cookbook "reportServer"
  source "awscli-config.erb"
  owner "ubuntu"
  group "ubuntu"
  mode 0600
end

template "/home/ubuntu/.aws/credentials" do
  cookbook "reportServer"
  source "awscli-credentials.erb"
  owner "ubuntu"
  group "ubuntu"
  mode 0600
end

directory "/root/.aws/" do
  mode 0700
  owner 'root'
  group 'root'
  action :create
end

template "/root/.aws/config" do
  cookbook "reportServer"
  source "awscli-config.erb"
  owner "root"
  group "root"
  mode 0600
end

template "/root/.aws/credentials" do
  cookbook "reportServer"
  source "awscli-credentials.erb"
  owner "root"
  group "root"
  mode 0600
end

directory "/home/ubuntu/bin/" do
  mode 0775
  owner 'ubuntu'
  group 'ubuntu'
  action :create
end

template "/home/ubuntu/bin/run.sh" do
  cookbook "reportServer"
  source "ubuntu-bin-run.sh.erb"
  owner "ubuntu"
  group "ubuntu"
  mode 0755
end

template "/home/ubuntu/bin/pullGitByTag.sh" do
  cookbook "reportServer"
  source "ubuntu-bin-pullGitByTag.sh.erb"
  owner "ubuntu"
  group "ubuntu"
  mode 0755
end
