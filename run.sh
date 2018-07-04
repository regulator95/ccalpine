#!/bin/sh
if [ -d "/root/cc-ui" ]; then
	echo "Skipping cc ui install"
else
  cd /root
  git clone https://github.com/regulator95/cc-ui
fi
cd /root/cc-ui
npm install 
ng build --output-path /var/www/localhost/htdocs --watch &

exec httpd -D FOREGROUND
