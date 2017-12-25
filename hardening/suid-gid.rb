# may contain: change_user
default['os-hardening']['security']['users']['allow']                  = []
default['os-hardening']['security']['kernel']['enable_module_loading'] = true
default['os-hardening']['security']['kernel']['disable_filesystems']   = %w[cramfs freevxfs jffs2 hfs hfsplus squashfs udf vfat]
default['os-hardening']['security']['kernel']['enable_sysrq']          = false
default['os-hardening']['security']['kernel']['enable_core_dump']      = false
default['os-hardening']['security']['suid_sgid']['enforce']            = true
# user-defined blacklist and whitelist
default['os-hardening']['security']['suid_sgid']['blacklist']          = []
default['os-hardening']['security']['suid_sgid']['whitelist']          = []
# if this is true, remove any suid/sgid bits from files that were not in the
# whitelist
default['os-hardening']['security']['suid_sgid']['remove_from_unknown'] = false
default['os-hardening']['security']['suid_sgid']['dry_run_on_unknown']  = false
# list of suid/sgid entries that can remain untouched
default['os-hardening']['security']['suid_sgid']['system_whitelist']          = [
  # whitelist as provided by NSA
  '/bin/mount', '/bin/ping', '/bin/su', '/bin/umount', '/sbin/pam_timestamp_check',
  '/sbin/unix_chkpwd', '/usr/bin/at', '/usr/bin/gpasswd', '/usr/bin/locate',
  '/usr/bin/newgrp', '/usr/bin/passwd', '/usr/bin/ssh-agent', '/usr/libexec/utempter/utempter', '/usr/sbin/lockdev',
  '/usr/sbin/sendmail.sendmail', '/usr/bin/expiry',
  # whitelist ipv6
  '/bin/ping6', '/usr/bin/traceroute6.iputils',
  # whitelist nfs
  '/sbin/mount.nfs', '/sbin/umount.nfs',
  # whitelist nfs4
  '/sbin/mount.nfs4', '/sbin/umount.nfs4',
  # whitelist cron
  '/usr/bin/crontab',
  # whitelist consolemssaging
  '/usr/bin/wall', '/usr/bin/write',
  # whitelist: only SGID with utmp group for multi-session access
  #            impact is limited; installation/usage has some remaining risk
  '/usr/bin/screen',
  # whitelist locate
  '/usr/bin/mlocate',
  # whitelist usermanagement
  '/usr/bin/chage', '/usr/bin/chfn', '/usr/bin/chsh',
  # whitelist fuse
  '/bin/fusermount',
  # whitelist pkexec
  '/usr/bin/pkexec',
  # whitelist sudo
  '/usr/bin/sudo', '/usr/bin/sudoedit',
  # whitelist postfix
  '/usr/sbin/postdrop', '/usr/sbin/postqueue',
  # whitelist apache
  '/usr/sbin/suexec',
  # whitelist squid
  '/usr/lib/squid/ncsa_auth', '/usr/lib/squid/pam_auth',
  # whitelist kerberos
  '/usr/kerberos/bin/ksu',
  # whitelist pam_caching
  '/usr/sbin/ccreds_validate',
  # whitelist Xorg
  '/usr/bin/Xorg',                                              # xorg
  '/usr/bin/X',                                                 # xorg
  '/usr/lib/dbus-1.0/dbus-daemon-launch-helper',                # freedesktop ipc
  '/usr/lib/vte/gnome-pty-helper',                              # gnome
  '/usr/lib/libvte9/gnome-pty-helper',                          # gnome
  '/usr/lib/libvte-2.90-9/gnome-pty-helper'                     # gnome
]

