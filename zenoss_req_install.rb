#
# Cookbook Name:: installstuff
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#
#----------------------------------------
#--------------CENTOS/REDHAT-------------
#----------------------------------------
#
if node[:platform_family].include?("rhel") || node[:platform_family].include?("centos")
#
#----------------SNMP---------------------
#
package "net-snmp" do
	action:install
end

cookbook_file "/etc/snmp/snmpd.conf" do
	source "snmpd.conf"
	mode "0644"
end

cookbook_file "/etc/snmp/snmp.conf" do
	source "snmp.conf"
	mode "0644"
end
#
#----------------SNMPTRAPD----------------
#
cookbook_file "/etc/snmp/snmptrapd.conf" do
	source "snmptrapd.conf"
	mode "0644"
end

service "snmpd" do
	action [:enable, :start]
end
#
#---------------NGINX--------------------
#
control_group 'nginx check' do
 control 'nginx validation' do 
  it 'directory exist' do
	expect(file('/etc/nginx')).to be_directory
   
        cookbook_file "/etc/nginx/nginx.conf" do
	       	 source "nginx.conf"
       		 mode "0644"
 	 end
 
	service "nginx" do
		action [:enable, :start]
 	end
  end
 end
end

end

#
#-----------------------------------------
#---------------UBUNTU--------------------
#-----------------------------------------
#
if node[:platform_family].include?("ubuntu")
#
#----------------APT-GET--------------------
#
execute "apt-get-update" do
  command "apt-get update"
  ignore_failure true
  action :run
end
#
#----------------SNMPD-----------------------
#
package "snmpd" do
	action :install
end

cookbook_file "/etc/snmp/snmpd.conf" do
	source "snmpd.conf"
	mode "0644"
end
cookbook_file "/etc/snmp/snmp.conf" do
	source "snmp.conf"
	mode "0644"
end
#
#-----------------SNMPTRAPD----------------------
#
cookbook_file "/etc/snmp/snmptrapd.conf" do
	source "snmptrapd.conf"
	mode "0644"
end

service "snmpd" do
        action [:enable, :start]
end
#
#---------------NGINX------------------------
#

control_group 'nginx check' do
 control 'nginx validation' do 
  it 'directory exist' do
        expect(file('/etc/nginx')).to be_directory
         
        cookbook_file "/etc/nginx/nginx.conf" do
                 source "nginx.conf"
                 mode "0644"
         end
        
        service "nginx" do
                action [:enable, :start]
        end
  end
 end
end

end