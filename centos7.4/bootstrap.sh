#!/usr/bin/env bash

cp /vagrant/hosts /etc/hosts
cp /vagrant/resolv.conf /etc/resolv.conf

sed -i -e 's/enabled=1/enabled=0' /etc/yum/pluginconf.d/fastestmirror.conf

yum install -y ntp
service ntpd start

mkdir -p /root/.ssh
chmod 700 /root/.ssh
cp /home/vagrant/.ssh/authorized_keys /root/.ssh/

# Increasing swap space
dd if=/dev/zero of=/swapfile bs=1024 count=1024k
mkswap /swapfile
swapon /swapfile
echo "/swapfile       none    swap    sw      0       0" >> /etc/fstab

cp /vagrant/insecure_private_key /root/ec2-keypair
chmod 600 /root/ec2-keypair
