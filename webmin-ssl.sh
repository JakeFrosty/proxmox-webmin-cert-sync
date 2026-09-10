#!/bin/sh

# place this in /etc/cron.daily and give it execute bits

if ! cmp "/etc/pve/local/pveproxy-ssl.pem" "/etc/webmin/pveproxy-ssl.pem"; then
  cp /etc/pve/local/pveproxy-ssl.pem /etc/webmin/pveproxy-ssl.pem
  cp /etc/pve/local/pveproxy-ssl.key /etc/webmin/pveproxy-ssl.key
  cat /etc/webmin/pveproxy-ssl.pem > /etc/webmin/miniserv.pem
  echo "" >> /etc/webmin/miniserv.pem
  echo "" >> /etc/webmin/miniserv.pem
  cat /etc/webmin/pveproxy-ssl.key >> /etc/webmin/miniserv.pem
  systemctl restart webmin
fi
