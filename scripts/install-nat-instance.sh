#!/usr/bin/env bash

# Enable output of all commands, exit on first failure
set -e -x

# Configuration
VPC_CIDR="${vpc_cidr}"

INTERFACE=`ip route list | grep default | grep -E 'dev (\w+)' -o | awk '{print $2}'`

# Enable ipv4 ip forwarding
echo net.ipv4.ip_forward=1 > /etc/sysctl.d/60-ip_forward.conf
/usr/sbin/service procps restart

# Enable NAT
mkdir -p /etc/network/if-up.d/
echo "iptables -t nat -A POSTROUTING -o $INTERFACE -s $VPC_CIDR -j MASQUERADE" > /etc/network/if-up.d/forwarding
chmod 755 /etc/network/if-up.d/forwarding
/etc/network/if-up.d/forwarding
