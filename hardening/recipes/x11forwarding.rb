ruby_block 'disabling x11 forwarding' do
  block do
    file = Chef::Util::FileEdit.new(node['hardening']['sshd'])
    file.search_file_replace_line(Regexp.new('X11Forwarding yes'), 'X11Forwarding no')
   file.write_file
        Chef::Log.info('disabling x11 forwarding')
  end
 only_if { ::File.readlines(node['hardening']['sshd']).grep(Regexp.new('X11Forwarding yes')).any? }
end
