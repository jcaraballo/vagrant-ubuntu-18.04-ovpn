#!/usr/bin/env bash

VH=/home/vagrant

export DEBIAN_FRONTEND=noninteractive

echo Updating apt sources
apt-get update

echo Updating packages
ps aux | grep apt
apt-get -y upgrade

echo Setting up ovpn
sudo apt-get -y install network-manager-openvpn-gnome

echo ipvanish ovpn configurations
mkdir /ipvanish && cd /ipvanish && wget --no-verbose https://www.ipvanish.com/software/configs/configs.zip && unzip -q configs.zip
