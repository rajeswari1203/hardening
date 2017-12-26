node['hardening']['service_list'].each do |service|
  service service do
    action :disable
                Chef::Log.info("Disabled #{service}")
  end                                                                                                                                                
end

Chef::Log.info('Disabled unnecessary services')

