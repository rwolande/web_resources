#!/bin/bash

EXPECTED_ARGS=2
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 name repository"
  exit $E_BADARGS
fi

path_name=$1
repository=$2

#PHASE 2 BEGIN - Clone wapi & link
echo "Cloning Repository"
mkdir ~/$path_name
git clone $repository ~/$path_name

echo "Creating link"
sudo ln -sT ~/$path_name /var/www/html/$path_name
sudo apachectl restart

echo "Installing additional requirements"
cd ~/$path_name;
sudo pip install -r requirements.txt;

echo "Done (:"