file node['hardening']['log'] do
  mode '0600'
end
directory node['hardening']['log'] do
  recursive true
  mode '0700'
  action :create
end

