vagrant-ubuntu-18.04-ovpn
=========================

Vagrant/VirtualBox configuration to build an Ubuntu Desktop Bionic 18.04 LTS with OpenVPN

It's based on the box [jcaraballo/ubuntu-desktop-bionic](https://app.vagrantup.com/jcaraballo/boxes/ubuntu-desktop-bionic),
created as described in [its GitHub project](https://github.com/jcaraballo/vagrant-box-ubuntu-desktop-bionic)

Requires
--------

* [Vagrant](https://www.vagrantup.com/downloads.html)
```
wget https://releases.hashicorp.com/vagrant/2.1.2/vagrant_2.1.2_x86_64.deb
sudo dpkg -i vagrant_2.1.2_x86_64.deb
```

* [VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads)
```
echo deb http://download.virtualbox.org/virtualbox/debian $( lsb_release -cs ) contrib | sudo tee -a /etc/apt/sources.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y virtualbox-5.2 dkms
```

* VirtualBox Extension Pack
  - Download the [VirtualBox 5.2.12 Oracle VM VirtualBox Extension Pack](https://download.virtualbox.org/virtualbox/5.2.12/Oracle_VM_VirtualBox_Extension_Pack-5.2.12.vbox-extpack) from the VirtualBox site 
  - Install from the VirtualBox Manager or simply double click on the extension package file

Usage
-----
If you have previously downloaded [jcaraballo/ubuntu-desktop-bionic](https://app.vagrantup.com/jcaraballo/boxes/ubuntu-desktop-bionic) you might want to update to the latest version with
```
vagrant box update --box jcaraballo/ubuntu-desktop-bionic
```

Then create the vagrant image for OpenVPN with:

```
vagrant up
vagrant ssh

cd /ipvanish ; sudo openvpn --config ipvanish-NL-Amsterdam-ams-a01.ovpn
```

Or, if you prefer to store the credentials in a file
```
sudo touch /ipvanish/pass.txt
sudo chmod 600 /ipvanish/pass.txt
 echo '<username>' | sudo tee -a /ipvanish/pass.txt
 echo '<password>' | sudo tee -a /ipvanish/pass.txt

cd /ipvanish/ ; sudo openvpn --config /ipvanish/ipvanish-NL-Amsterdam-ams-a01.ovpn --auth-user-pass pass.txt
```
