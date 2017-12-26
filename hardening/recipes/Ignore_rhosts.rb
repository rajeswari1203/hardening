ruby_block 'Ignorerhosts' do
  block do
    file = Chef::Util::FileEdit.new(node['hardening']['sshd'])
    file.search_file_replace_line(Regexp.new('#IgnoreRhosts yes'), 'IgnoreRhosts yes')
   file.write_file
        Chef::Log.info('Ignoring rhosts')
  end
 only_if { ::File.readlines(node['hardening']['sshd']).grep(Regexp.new('#IgnoreRhosts yes')).any? }
end
