ruby_block 'time out interval' do
  block do
    file = Chef::Util::FileEdit.new(node['hardening']['sshd'])
    file.search_file_replace_line(Regexp.new('#ClientAliveInterval 0'), 'ClientAliveInterval 300')
    file.search_file_replace_line(Regexp.new('##ClientAliveCountMax 3'), '#ClientAliveCountMax 0')

   file.write_file
        Chef::Log.info('setting time out interval')
  end
 only_if { ::File.readlines(node['hardening']['sshd']).grep(Regexp.new('#ClientAliveInterval 0')).any? }
end
ruby_block 'Alive max  interval' do
  block do
    file = Chef::Util::FileEdit.new(node['hardening']['sshd'])
    file.search_file_replace_line(Regexp.new('#ClientAliveCountMax 3'), 'ClientAliveCountMax 0')

   file.write_file
        Chef::Log.info('setting max  interval')
  end
 only_if { ::File.readlines(node['hardening']['sshd']).grep(Regexp.new('#ClientAliveCountMax 3')).any? }
end


