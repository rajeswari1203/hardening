ruby_block 'disallow empty pwd' do
  block do
    file = Chef::Util::FileEdit.new(node['hardening']['sshd'])
    file.search_file_replace_line(Regexp.new('#PermitEmptyPasswords no'), 'PermitEmptyPasswords no')
   file.write_file
        Chef::Log.info('disallow empty password')
  end
 only_if { ::File.readlines(node['hardening']['sshd']).grep(Regexp.new('#PermitEmptyPasswords no')).any? }
end
