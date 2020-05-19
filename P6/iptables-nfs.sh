#!/bin/bash

# Denegación implícita
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Puertos NFS
iptables -A INPUT -s 192.168.56.103,192.168.56.101 -p tcp -m multiport --ports 111,2000,2001,2049 -j ACCEPT

iptables -A INPUT -s 192.168.56.103,192.168.56.101 -p udp -m multiport --ports 111,2000,2002,2049 -j ACCEPT
