directory node['hardening']['boot'] do
  owner 'root'
  group 'root'
  mode '0600'
  action :create
end
file node['hardening']['grub'] do
   mode '0600'
   owner 'root'
end

