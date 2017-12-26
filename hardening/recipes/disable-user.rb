node['hardening']['user_list'].each do |user|
  user user do
   shell '/sbin/nologin'
  action :remove
                Chef::Log.info("Disabled #{user}")
  end
end

