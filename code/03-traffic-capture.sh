echo "192.168.10.4 vtcsec" | sudo tee -a /etc/hosts

# Start the Wireshark packet capture on eth0 (capture while generating traffic).
# In Wireshark, filter FTP with:   ftp
# then use Follow -> TCP Stream to read USER/PASS in clear text.
wireshark &

# Generate FTP traffic. At the prompts enter:
#   user: topu      password: test123      then type: quit
# The login is rejected, but the credentials still cross the network.
ftp 192.168.10.4

# HTTP traffic was generated in the browser by submitting a test login at:
#   http://192.168.10.4/secret/wp-login.php   (user: topu, password: ttest123)
# In Wireshark, filter the POST request with:
#   http.request.method == "POST"
# The form fields (log=topu, pwd=ttest123) appear in clear text.
