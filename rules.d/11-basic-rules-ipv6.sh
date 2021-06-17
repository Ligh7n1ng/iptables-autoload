#!/bin/bash

echo "Adding new basic rules IPv6..."

# Allow localhost
ip6tables -A INPUT -i lo -j ACCEPT
ip6tables -A OUTPUT -o lo -j ACCEPT

# Allow outgoing connections for NICs
ip6tables -A OUTPUT -o enp0s3 -j ACCEPT
ip6tables -A OUTPUT -o enp0s8 -j ACCEPT

# Protection from some attacks
ip6tables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
ip6tables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
ip6tables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
ip6tables -A INPUT -m conntrack --ctstate INVALID -j DROP
ip6tables -t raw -I PREROUTING -m rpfilter --invert -j DROP

# Allow established connections
ip6tables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
ip6tables -A OUTPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Block everything else
ip6tables -P INPUT DROP
ip6tables -P OUTPUT DROP
ip6tables -P FORWARD DROP
