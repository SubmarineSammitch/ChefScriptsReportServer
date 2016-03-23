directory "/opt/aws/cloudwatch" do
  recursive true
end

remote_file "/opt/aws/cloudwatch/awslogs-agent-setup.py" do
  source #your s3 repository location with file
  mode "0755"
end

execute "Install CloudWatch Logs agent" do
  command "your s3 repository location with file -n -r region -c /tmp/cwlogs.cfg >/var/log/outputlog.out 2>&1"
  not_if { system "pgrep -f aws-logs-agent-setup" }
end
