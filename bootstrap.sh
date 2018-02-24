#!/usr/bin/env bash

VH=/home/vagrant

export DEBIAN_FRONTEND=noninteractive

echo Updating apt sources
until apt-get update ; do echo retrying updating apt sources... ; done

echo Updating packages
until apt-get -y upgrade ; do echo retrying updating packages... ; done

echo Setting up ovpn
sudo apt-get -y install network-manager-openvpn-gnome

echo ipvanish ovpn configurations
mkdir /ipvanish && cd /ipvanish && wget --no-verbose https://www.ipvanish.com/software/configs/configs.zip && unzip -q configs.zip
