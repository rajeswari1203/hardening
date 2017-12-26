execute "backup_yum.conf" do
    command "cp -p /etc/snmp/snmpd.conf /etc/snmp/snmpd.conf.bkp"
        not_if { File.exist?("/etc/snmp/snmpd.conf.bkp") }
 end
ruby_block 'snmpd' do
  block do
    file = Chef::Util::FileEdit.new(node['hardening']['snmpd'])
    file.search_file_replace_line(Regexp.new('com2sec notConfigUser  default       public'), '#com2sec notConfigUser  default       public')

        file.write_file
        Chef::Log.info('removing public and private entries')
  end
 only_if { ::File.readlines(node['hardening']['snmpd']).grep(Regexp.new('com2sec notConfigUser  default       public')).any? }
end
