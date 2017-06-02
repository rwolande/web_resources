#!/bin/bash

EXPECTED_ARGS=4
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 domain path db_name db_password"
  exit $E_BADARGS
fi

domain=$1
path=$2
db_name=$3
db_password=$4

./ssl.sh "$domain"
./link_repo.sh "$path" "https://github.com/rwolande/$path"
./db_config.sh "$db_name" "$db_password" "$path"
./sync_apache.sh "$domain" "$path"