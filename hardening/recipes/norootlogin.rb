execute "/etc/ssh/sshd_config.conf" do
    command "cp -p /etc/ssh/sshd_config //etc/ssh/sshd_config.bkp"
        not_if { File.exist?("/etc/ssh/sshd_config.bkp") }
end

ruby_block 'norootlogin' do
  block do
    file = Chef::Util::FileEdit.new(node['hardening']['sshd'])
    file.search_file_replace_line(Regexp.new('#PermitRootLogin yes'), 'PermitRootLogin no')

        file.write_file
        Chef::Log.info('disabling root login access')
  end
 only_if { ::File.readlines(node['hardening']['sshd']).grep(Regexp.new('#PermitRootLogin yes')).any? }
end
