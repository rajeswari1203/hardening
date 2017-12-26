ruby_block "Cipher" do
  block do
    file = Chef::Util::FileEdit.new(node['hardening']['sshd'])
    file.insert_line_if_no_match("/Ciphers aes256-ctr,aes192-ctr,aes128-ctr/", "Ciphers aes256-ctr,aes192-ctr,aes128-ctr")
    file.write_file
  end
end
