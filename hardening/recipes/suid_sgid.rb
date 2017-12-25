sb = node['os-hardening']['security']['suid_sgid']['system_blacklist']
sw = node['os-hardening']['security']['suid_sgid']['system_whitelist']
b  = node['os-hardening']['security']['suid_sgid']['blacklist']
w  = node['os-hardening']['security']['suid_sgid']['whitelist']

blacklist = (sb - w + b).uniq
whitelist = (sw - b + w).uniq

# root    = "/"
dry_run   = node['os-hardening']['security']['suid_sgid']['dry_run_on_unknown']
root      = node['os-hardening']['env']['root_path']

# walk the blacklist and remove suid and sgid bits from these items
ruby_block 'remove_suid_from_blacklists' do
  block do
    SuidSgid.remove_suid_sgid_from_blacklist(blacklist)
  end
end

# remove suid bits from unknown, if desired
ruby_block 'remove_suid_from_unknown' do
  block do
    SuidSgid.remove_suid_sgid_from_unknown(whitelist, root, dry_run)
  end
  only_if do
    node['os-hardening']['security']['suid_sgid']['remove_from_unknown'] ||
      node['os-hardening']['security']['suid_sgid']['dry_run_on_unknown']
  end
end
