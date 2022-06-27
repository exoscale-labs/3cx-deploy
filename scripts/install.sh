#!/bin/bash -e
wget -O- http://downloads-global.3cx.com/downloads/3cxpbx/public.key | apt-key add -
echo "deb http://downloads-global.3cx.com/downloads/debian buster main" | tee /etc/apt/sources.list.d/3cxpbx.list
apt-get update
apt-get -y install nginx net-tools dphys-swapfile gnupg2
rm -f /etc/nginx/sites-enabled/default
systemctl reload nginx
apt-get -y install 3cxpbx
