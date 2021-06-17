#!/bin/bash

echo "Blocking some bad IPs..."

# iptables -A INPUT -s 10.0.10.25 -j REJECT