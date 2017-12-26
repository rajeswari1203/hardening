ruby_block 'dnd Entries' do
  block do
    file = Chef::Util::FileEdit.new(node['hardening']['trusteddns'])
    file.search_file_replace_line(Regexp.new('search ap-south-1.compute.internal'), 'search 54.191.157.140')
	file.search_file_replace_line(Regexp.new('nameserver 10.1.0.2'), 'nameserver 192.168.1.254')
	file.write_file
    Chef::Log.info('Setting trusted DNS')
  end
 only_if { ::File.readlines(node['hardening']['trusteddns']).grep(Regexp.new('ap-south-1.compute.internal')).any? }
end

