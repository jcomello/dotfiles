#!/bin/bash

if
  [[ "${USER:-}" == "root" ]]
then
  echo "This script works only with normal user, it wont work with root, please log in as normal user and try again." >&2
  exit 1
fi

set -e

echo "Updates packages. Asks for your password."
sudo apt-get update -y

echo "Installs Node 10"
sudo apt-get install -y snapd
sudo snap install node --classic --channel=10

echo "Installs packages. Give your password when asked."
sudo apt-get --ignore-missing install build-essential git-core curl openssl libssl-dev libcurl4-openssl-dev zlib1g zlib1g-dev libreadline6-dev libyaml-dev libsqlite3-dev libsqlite3-0 sqlite3 libxml2-dev libxslt1-dev libffi-dev software-properties-common libgdm-dev libncurses5-dev automake autoconf libtool bison postgresql postgresql-contrib libpq-dev pgadmin3 libc6-dev -y

echo "Installs RVM (Ruby Version Manager) for handling Ruby installation"
# Retrieve the GPG key.
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

echo "Installs Ruby"
rvm install 2.6.3
rvm use 2.6.3 --default

