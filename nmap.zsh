#!/bin/zsh

# Retrieve the private IP address on the current WI-FI network
ip=$(ipconfig getifaddr en0)
echo "Private IP: $ip"

# Remove the last octet of the IP address
baseip="${ip%.*}"

# Add the subnet
IPandSubnet="$baseip.0/24"
echo "Base IP and Subnet: $IPandSubnet"

# Call nmap using host discovery tag
output=$(sudo nmap -sn $IPandSubnet)
echo "$output"
