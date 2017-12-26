ruby_block 'protocal2' do
  block do
    file = Chef::Util::FileEdit.new(node['hardening']['sshd'])
    file.search_file_replace_line(Regexp.new('#Protocol 2'), 'Protocol 2')
   file.write_file
        Chef::Log.info('changing from protocal 1 to protocal2')
  end
 only_if { ::File.readlines(node['hardening']['sshd']).grep(Regexp.new('#Protocol 2')).any? }
end
