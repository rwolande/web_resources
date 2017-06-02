#!/bin/bash

EXPECTED_ARGS=4
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 domain path db_name db_password"
  exit $E_BADARGS
fi

db_name=$1
db_password=$2
domain=$3
path=$4

./ssl.sh "$domain"
./link_repo.sh "$path" "https://github.com/rwolande/$path"
./db_config.sh "$db_name" "$db_password" "$path"
./sync_apache.sh "$domain" "$path"