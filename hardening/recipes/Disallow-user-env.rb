ruby_block 'disallow user env' do
  block do
    file = Chef::Util::FileEdit.new(node['hardening']['sshd'])
    file.search_file_replace_line(Regexp.new('#PermitUserEnvironment no'), 'PermitUserEnvironment no')
   file.write_file
        Chef::Log.info('disallow user env')
  end
 only_if { ::File.readlines(node['hardening']['sshd']).grep(Regexp.new('#PermitUserEnvironment no')).any? }
end
