#!/bin/sh
sudo service nginx stop
sudo certbot renew > /home/daiv/deploy/cert_renew.log
fuser -k 80/tcp
sudo service nginx start
