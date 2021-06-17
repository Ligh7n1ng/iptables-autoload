#!/bin/bash

echo "Wiping all previous rules..."

iptables -t filter -F
iptables -t nat -F
iptables -t mangle -F
iptables -t raw -F
iptables -t security -F

iptables -t filter -X
iptables -t nat -X
iptables -t mangle -X
iptables -t raw -X
iptables -t security -X