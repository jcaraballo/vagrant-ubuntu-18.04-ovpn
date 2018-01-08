vagrant-ubuntu-16.04-ovpn
=========================

Vagrant/VirtualBox configuration to build an Ubuntu Desktop Xenial 16.04.3 LTS with open vpn

It's based on the box [jcaraballo/ubuntu-desktop-xenial](https://app.vagrantup.com/jcaraballo/boxes/ubuntu-desktop-xenial),
created as described in [its GitHub project](https://github.com/jcaraballo/vagrant-box-ubuntu-desktop-xenial)

Requires
--------

* [Vagrant](https://www.vagrantup.com/downloads.html)
```
wget https://releases.hashicorp.com/vagrant/2.0.1/vagrant_2.0.1_x86_64.deb
sudo dpkg -i vagrant_2.0.1_x86_64.deb
```

* [VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads)
```
echo deb http://download.virtualbox.org/virtualbox/debian $( lsb_release -cs ) contrib | sudo tee -a /etc/apt/sources.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y virtualbox-5.2 dkms
```

Usage
-----
If you have previously downloaded [jcaraballo/ubuntu-desktop-xenial](https://app.vagrantup.com/jcaraballo/boxes/ubuntu-desktop-xenial) you might want to update to the latest version with
```
vagrant box update --box jcaraballo/ubuntu-desktop-xenial
```

Then create the vagrant image for open vpen with:

```
vagrant up
vagrant ssh

cd /ipvanish
sudo openvpn --config ipvanish-NL-Amsterdam-ams-a01.ovpn
```

