#!/bin/bash

EXPECTED_ARGS=3
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 db_name db_password path_name"
  exit $E_BADARGS
fi

db_name=$1
db_password=$2
path=$3

#PHASE 3 BEGIN - Set up environment and database
echo "Configuring Environment Settings"
{
  echo -n $'DB_ENV = \'local\''; echo -e $' #ENVIRONMENT (ENUM)\n'

  echo -n 'MYSQL_DB = '\'${db_name}; echo $'\' #SQL DB NAME'
  echo -n $'MYSQL_HOST = \'localhost\''; echo ' #SQL HOST'
  echo -n $'MYSQL_USER = \'root\''; echo ' #SQL USER'
  echo -n 'MYSQL_PASSWORD = '\'${db_password}; echo -e $'\' #SQL DB PW\n'

  echo -n $'JWT_KEY = \'\''; echo ' #JWT KEY'
  echo -n $'LOG_DIR = \'~/dev/api/log\''; echo ' #LOG DIRECTORY'
} > ~/$path/instance/config.py

echo "Generating basic database from api/sql/create_db script for DB ${db_name}"
sudo ~/$path/api/sql/create_db $db_name
echo "Done (:"