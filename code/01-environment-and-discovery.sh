#!/usr/bin/env bash
#
# Phase 1 - Target Selection and Environment Preparation
# Verifying the isolated lab network and locating the target host.
#
# Lab setup (done in the VirtualBox GUI, no shell commands):
#   - Target: "Basic Pentesting 1" (VulnHub), imported from its .ova file.
#   - NAT Network "NatNetwork", IPv4 range 192.168.10.0/24, DHCP enabled.
#   - Kali Linux -> 192.168.10.3 (attacker)
#   - Target     -> 192.168.10.4 (vtcsec)
#
# Run these from the Kali Linux machine.

# Show the local interfaces and confirm Kali's DHCP-assigned address.
ip a

# Discover active hosts on the lab subnet to locate the target.
# -i eth0 : capture interface   -r : address range to scan
sudo netdiscover -i eth0 -r 192.168.10.0/24

# Verify connectivity to the target (expect replies with 0% packet loss).
ping -c 4 192.168.10.4
