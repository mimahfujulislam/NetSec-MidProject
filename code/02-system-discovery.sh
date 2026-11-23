#!/usr/bin/env bash
#
# Phase 2 - System Discovery
# Enumerating open ports, service versions, and web-server weaknesses
# on the target (192.168.10.4). Run from Kali Linux.

# Service and version detection scan.
# Observed results:
#   21/tcp  FTP   ProFTPD 1.3.3c
#   22/tcp  SSH   OpenSSH 7.2p2 (Ubuntu)
#   80/tcp  HTTP  Apache httpd 2.4.18 (Ubuntu)
nmap -sV 192.168.10.4

# Fingerprint the web technologies (confirmed Apache 2.4.18 on Ubuntu).
whatweb http://192.168.10.4

# Web-server vulnerability enumeration.
# Reported: outdated Apache, missing security headers
# (X-Content-Type-Options, Content-Security-Policy, Strict-Transport-Security)
# and ETag inode disclosure (CVE-2003-1418).
nikto -h 192.168.10.4
