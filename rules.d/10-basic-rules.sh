#!/bin/bash

echo "Adding new basic rules..."

# Allow localhost
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow outgoing connections for NICs
iptables -A OUTPUT -o enp0s3 -j ACCEPT
iptables -A OUTPUT -o enp0s8 -j ACCEPT

# Allow ping requests
iptables -A INPUT -p icmp --icmp-type 8 -m conntrack --ctstate NEW -j ACCEPT

# Protection from some attacks
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP
iptables -t raw -I PREROUTING -m rpfilter --invert -j DROP

# Allow established connections
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Block everything else
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
