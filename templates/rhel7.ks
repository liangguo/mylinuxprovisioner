#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512
repo --name="Server-HighAvailability" --baseurl={{ vm_base_url }}yum/{{ vm_repo_name }}/addons/HighAvailability
repo --name="Server-ResilientStorage" --baseurl={{ vm_base_url }}yum/{{ vm_repo_name }}/addons/ResilientStorage
# Use CDROM installation media
text
install
url --url {{ vm_base_url }}yum/{{ vm_repo_name }}
poweroff
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=vda
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8
eula --agreed
firstboot --disable
# Network information
network  --bootproto=static --device=eth0 --gateway={{ vm_gateway }}  --ip={{ vm_ipaddr }} --nameserver={{ vm_dns }} --netmask={{ vm_netmask }} --ipv6=auto --activate
network  --hostname={{ inventory_hostname }}

shutdown

# Root password
rootpw "rhelrhel"
# System services
services --disabled="chronyd"
# System timezone
timezone Asia/Shanghai --isUtc --nontp
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=vda
zerombr
autopart --type=lvm
# Partition clearing information
clearpart --none --initlabel
selinux --disabled

%packages
@^minimal
@core
kexec-tools
wget
yum-utils
%end


%post --log=/root/ks-post.log
mkdir /root/.ssh
wget {{ vm_base_url }}/authorized_keys -O /root/.ssh/authorized_keys
chmod 700 /root/.ssh
chmod 600 /root/.ssh/authorized_keys
yum-config-manager --add-repo  {{ vm_base_url }}yum/{{ vm_repo_name }}
%end

