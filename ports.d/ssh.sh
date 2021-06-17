#!/bin/bash

echo "Opening ports for OpenSSH server..."

iptables -A INPUT -i enp2s0 -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -i enp3s0 -p tcp -m tcp --dport 22 -j ACCEPT
