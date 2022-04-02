#!/bin/bash
sudo apt update -y
sudo apt install apache2 -y
systemctl start apache2
systemctl enable apache2
tar -cvf /tmp/hemant-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar /var/log/apache2/*.log
aws s3 \
cp /tmp/hemant-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar \
s3://upgrad-hemant/hemant-httpd-logs-$(date '+%d%m%Y-%H%M%S').tar