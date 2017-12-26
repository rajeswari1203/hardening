file node['hardening']['log'] do
  mode '0600'
end
directory node['hardening']['log'] do
  recursive true
  mode '0700'
  action :create
end
bash 'change-permissions' do
  code <<-EOH
  sh /home/ec2-user/chef-repo/cookbooks/hardening/files/mode.sh
   EOH
end

