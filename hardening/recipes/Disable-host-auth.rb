ruby_block 'disablinghostauth' do
  block do
    file = Chef::Util::FileEdit.new(node['hardening']['sshd'])
    file.search_file_replace_line(Regexp.new('#HostbasedAuthentication no'), 'HostbasedAuthentication no')
   file.write_file
        Chef::Log.info('disabling host based authentication')
  end
 only_if { ::File.readlines(node['hardening']['sshd']).grep(Regexp.new('#HostbasedAuthentication no')).any? }
end
