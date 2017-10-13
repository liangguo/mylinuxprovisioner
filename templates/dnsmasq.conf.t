##WARNING:  THIS IS AN AUTO-GENERATED FILE. CHANGES TO IT ARE LIKELY TO BE
##OVERWRITTEN AND LOST.  Changes to this configuration should be made using:
##    virsh net-edit default
## or other application using the libvirt API.
##
## dnsmasq conf file created by libvirt
strict-order
except-interface=lo
bind-dynamic
pid-file=/tmp/dnsmasq/dnsmasq.pid
interface=virbr1
dhcp-option=3

#dhcp-option=3,192.168.2.12
#dhcp-option=252,http://192.168.2.12/p.pac
#no-resolv
dhcp-range=192.168.23.100,192.168.23.240
tftp-root=/tmp/dnsmasq/tftp
no-resolv
no-poll
listen-address=192.168.23.1
cache-size=10240
enable-tftp
dhcp-boot=pxelinux.0
dhcp-lease-max=127
