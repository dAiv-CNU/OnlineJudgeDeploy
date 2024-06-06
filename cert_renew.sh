#!/bin/sh
cd /home/daiv/deploy
sudo service nginx stop
sudo docker compose down
sudo certbot renew > ./cert_renew.log
fuser -k 80/tcp
sudo service nginx start
sudo docker compose up -d
