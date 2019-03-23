#platform=x86, AMD64, or Intel EM64T
#version=DEVEL

# Firewall configuration
firewall --disabled

# Install OS instead of upgrade
install
nfs --server=192.168.3.146 --dir=/data/Software/OS/Fedora-Server-dvd-x86_64-29-1.2
# Use FTP installation media
#url --url="ftp://172.168.1.11/pub/"

# Root password
rootpw --iscrypted $1$16UFOW3O$HYLRvEgT8qUZN2yG94.m2/

# System authorization information
auth useshadow passalgo=sha512

# Use graphical install
cmdline

#remove initial setup on first boot
firstboot --disable

# System keyboard
keyboard us

# System language
lang en_US

# SELinux configuration
selinux --disabled

# Installation logging level
logging --level=info

# System timezone
timezone America/New_York

# System bootloader configuration
bootloader --location=mbr

# automatically partition
autopart --nohome

# manually partition everything
#clearpart --all --initlabel
#part swap --asprimary --fstype="swap" --size=1024
#part /boot --fstype xfs --size=300
#part pv.01 --size=1 --grow
#volgroup root_vg01 pv.01
#logvol / --fstype xfs --name=lv_01 --vgname=root_vg01 --size=1 --grow

%packages
@^minimal
@core
%end

#%addon com_redhat_kdump --enable --reserve-mb='auto'
%addon com_redhat_kdump --disable
%end

