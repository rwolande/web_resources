#!/bin/bash

EXPECTED_ARGS=3
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 db_name db_password domain"
  exit $E_BADARGS
fi

db_name=$1
db_password=$2
domain=$3

#PHASE 1 BEGIN - Install necessary packages
echo "Installing Packages: update, apache2, mod-wsgi, python-pip, libssl-dev, setuptools"

#Apache and Environment
sudo apt-get -y update
sudo apt-get -y install apache2
sudo apt-get -y install libapache2-mod-wsgi
sudo apt-get -y install python-pip
sudo apt-get -y install build-essential libssl-dev libffi-dev python-dev
sudo -H pip install -U setuptools

#SSL
echo "Installing SSL"
sudo apt-get -y install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get -y update
sudo apt-get -y install python-certbot-apache
sudo certbot --apache -d $domain

sudo apachectl restart
echo "Done (:"