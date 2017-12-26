package 'Install rsyslog' do
  package_name 'rsyslog'
end
service "syslog" do
  action :stop
end
service "rsyslog" do
  action :start
end
