execute "backup_yum.conf" do
    command "cp -p /etc/yum.conf /etc/yum.conf.bkp"
        not_if { File.exist?("/etc/yum.conf.bkp") }
end

ruby_block 'gpgcheck' do
  block do
    file = Chef::Util::FileEdit.new('/etc/yum.conf')
    file.search_file_replace_line(Regexp.new('gpgcheck=0'), 'gpgcheck=1')
	
        file.write_file
        Chef::Log.info('configuring gpg check configurations')
  end
 only_if { ::File.readlines('/etc/yum.conf').grep(Regexp.new('gpgcheck=0')).any? }
end
