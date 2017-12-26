ruby_block 'max tries' do
  block do
    file = Chef::Util::FileEdit.new(node['hardening']['sshd'])
    file.search_file_replace_line(Regexp.new('#MaxAuthTries 6'), 'MaxAuthTries 5')
   file.write_file
        Chef::Log.info('setting Max tries to 5')
  end
 only_if { ::File.readlines(node['hardening']['sshd']).grep(Regexp.new('#MaxAuthTries 6')).any? }
end

