#!/bin/sh
cd /tmp/cc 
ng build --output-path /var/www/localhost/htdocs --watch &

exec httpd -D FOREGROUND
