ruby_block 'log_info' do
  block do
    file = Chef::Util::FileEdit.new(node['hardening']['sshd'])
    file.search_file_replace_line(Regexp.new('#LogLevel INFO'), 'LogLevel INFO')
   file.write_file
        Chef::Log.info('setting log to info')
  end
 only_if { ::File.readlines(node['hardening']['sshd']).grep(Regexp.new('#LogLevel INFO')).any? }
end
