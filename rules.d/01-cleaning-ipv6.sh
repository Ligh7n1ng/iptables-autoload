#!/bin/bash

echo "Wiping all previous rules IPv6..."

ip6tables -t filter -F
ip6tables -t nat -F
ip6tables -t mangle -F
ip6tables -t raw -F
ip6tables -t security -F

ip6tables -t filter -X
ip6tables -t nat -X
ip6tables -t mangle -X
ip6tables -t raw -X
ip6tables -t security -X
