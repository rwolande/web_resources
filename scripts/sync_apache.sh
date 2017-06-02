#!/bin/bash

EXPECTED_ARGS=2
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 domain path_name"
  exit $E_BADARGS
fi

domain=$1
path=$2

#PHASE 4 BEGIN - Sync
sudo chmod 777 /etc/apache2/sites-enabled
{
  echo -e "\n\tServerName ${domain}"
  echo -e "\n\tWSGIScriptAlias / /var/www/html/${path}/wsgi.py";
  echo -e "\n\t<Directory /var/www/html/${path}>";
  echo -e "\t\tWSGIApplicationGroup %{GLOBAL}";
  echo -e "\t\tRequire all granted";
  echo -e "\t</Directory>";
} > wol.conf
sed -i "13r wol.conf" /etc/apache2/sites-enabled/000-default.conf
sed -i "13r wol.conf" /etc/apache2/sites-enabled/000-default-le-ssl.conf
sudo apachectl restart
echo "Done (:"