nmap -sV 192.168.10.4

# Fingerprint the web technologies (confirmed Apache 2.4.18 on Ubuntu).
whatweb http://192.168.10.4

# Web-server vulnerability enumeration.
# Reported: outdated Apache, missing security headers
# (X-Content-Type-Options, Content-Security-Policy, Strict-Transport-Security)
# and ETag inode disclosure (CVE-2003-1418).
nikto -h 192.168.10.4
