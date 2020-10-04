#!/bin/bash
# Install Brozzler Script
# source: https://github.com/internetarchive/brozzler/tree/master/brozzler
# 
# Run Dashboard: brozzler-dashboard
# Add new site: brozzler-new-site http://halongtours.biz
# Run site: 
sudo apt-get update && sudo apt-get upgrade

# Install VirtualBox Extensions
sudo apt-get install -y gcc make perl screen mc

# Install ReThinkDB
source /etc/lsb-release && echo "deb https://download.rethinkdb.com/repository/ubuntu-$DISTRIB_CODENAME $DISTRIB_CODENAME main" | sudo tee /etc/apt/sources.list.d/rethinkdb.list
wget -qO- https://download.rethinkdb.com/repository/raw/pubkey.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y rethinkdb
rethinkdb &

# Install RethinkDB Driver
# sudo apt-get install python3-venv
# python3 -m venv ./venv
# pip3 install rethinkdb

# Install Chromium Browser
sudo apt-get install -y chromium-browser
 
# Install Brozzler
sudo apt install -y python3-pip
pip3 install brozzler
pip3 install brozzler[easy]
pip3 install brozzler[dashboard]
echo "PATH=\"\$PATH:\$HOME/.local/bin\"" >> ~/.bashrc

# Install requirements for warc2files
# pip3 install -r requirements.txt

echo "Installation Finished!"