#!/bin/sh
user_proxy=$1
echo $user_proxy
echo "export http_proxy=http://$user_proxy" >> /etc/profile
sudo useradd -u 12345 -g sudo -d /home/php -s /bin/bash -p $(echo php | openssl passwd -1 -stdin) php
sudo touch /etc/apt/apt.conf.d/30proxy
echo "Acquire::http::Proxy \"http://$user_proxy/\";" >> /etc/apt/apt.conf.d/30proxy
