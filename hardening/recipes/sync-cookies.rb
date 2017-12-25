ruby_block "set-sync-cookies" do
  block do
    file = Chef::Util::FileEdit.new(node['hardening']['sync-cookies-path'])
    file.insert_line_if_no_match("net.ipv4.tcp_syncookies=1", "net.ipv4.tcp_syncookies=1")
    file.write_file
  end
end
execute 'test-sync-cookies' do
  command 'sysctl -p'
end
