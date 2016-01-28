#!/usr/bin/env bash

# 
# for setting up various things automatically
#
# from: https://github.com/meinside/rpi-configs.git
#
# last update: 2016.01.28
# 
# by hwj4477@gmail.com
#

REPOSITORY="git://github.com/hwj4477/raspbian-configs"
TMP_DIR="$HOME/configs.tmp"

echo -e "\033[32mThis script will setup several things for your Raspberry Pi\033[0m\n"

# authenticate for sudo if needed
sudo -l > /dev/null

# clone config files
if ! which git > /dev/null; then
        echo -e "\033[33m>>> installing git...\033[0m"
        sudo apt-get update
        sudo apt-get -y install git
fi
rm -rf $TMP_DIR
git clone $REPOSITORY $TMP_DIR

# move to $HOME directory
shopt -s dotglob nullglob
mv $TMP_DIR/* $HOME/
rm -rf $TMP_DIR

# upgrade packages
echo -e "\033[33m>>> upgrading installed packages...\033[0m"
sudo apt-get update
sudo apt-get -y upgrade

# install other essential packages
echo -e "\033[33m>>> installing other essential packages...\033[0m"
sudo apt-get -y install vim tmux mosh

# cleanup
echo -e "\033[33m>>> cleaning up...\033[0m"
sudo apt-get -y autoremove
sudo apt-get -y autoclean

# install RVM and Ruby for single user
echo -e "\033[33m>>> installing RVM and Ruby...\033[0m"
curl -L https://get.rvm.io | bash -s stable --autolibs=homebrew --ruby

# re-login for loading configs
echo
echo -e "\033[31m*** logout, and login again for reloading configs ***\033[0m"
echo
