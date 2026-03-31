#!/bin/bash

yum update -y
yum install -y httpd

systemctl start httpd
systemctl enable httpd

# Get instance ID - try metadata first, fall back to hostname
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id 2>/dev/null)

# If empty, use hostname 
if [ -z "$INSTANCE_ID" ]; then
  INSTANCE_ID=$(hostname)
fi

# Create the HTML page
echo "<html><body><h1>Web Server: $INSTANCE_ID</h1><p>Hostname: $(hostname)</p></body></html>" > /var/www/html/index.html

systemctl reload httpd