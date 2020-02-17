#!/bin/bash

APPS_DIR=/apps
OORT_ROOT=$APPS_DIR/oort
OORT_DATA=$OORT_ROOT/data
OORT_LOGS=$OORT_DATA/logs

# Set used terminal colors
GREEN=$(tput setaf 2)
NORMAL=$(tput sgr0)
LIME_YELLOW=$(tput setaf 190)


# Run with sudo if not root
if [ "$(whoami)" != 'root' ]; then
  printf "${GREEN}This script needs root privilages.${NORMAL}\n"
  printf "\n"
  SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
  SELF=`basename $0`
  sudo $SCRIPTPATH'/'$SELF
  exit 1
fi

# Install confirmation 
printf "${GREEN}You are about to install Oort.${NORMAL}\n"
read -p "${LIME_YELLOW}Proceed? (y/N)${NORMAL} " -r
printf "\n"
if [[ ! $REPLY =~ ^[Yy*] ]]
then
    exit
fi
# Install dependencies
printf "${GREEN}Installing dependencies...${NORMAL}\n"
sudo add-apt-repository universe
apt-get update && apt-get -y upgrade && apt-get -y install --no-install-recommends \
    go
# Install Caddy
printf "${GREEN}Installing caddy as a service...${NORMAL}\n"
wget https://github.com/caddyserver/caddy/releases/download/v2.0.0-beta.14/caddy2_beta14_linux_amd64
sudo mv caddy /usr/bin/
groupadd --system caddy
useradd --system \
	--gid caddy \
	--create-home \
	--home-dir /var/lib/caddy \
	--shell /usr/sbin/nologin \
	--comment "Caddy web server" \
	caddy
wget https://raw.githubusercontent.com/caddyserver/dist/master/init/caddy.service
sudo mv caddy.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable caddy
sudo systemctl start caddy
