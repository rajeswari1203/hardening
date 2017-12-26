directory node['hardening']['logrotate'] do
 mode '0600'
  action :create
end
file node['hardening']['wtmp'] do
 
  mode '0640'

end
