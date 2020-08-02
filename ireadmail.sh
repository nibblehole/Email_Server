#!/bin/bash
sudo yum -y install epel-release
sudo yum install wget -y
#sudo yum -y update
sudo setenforce 0
sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config
sestatus
echo "What is your e.mail Domain Name?" 
echo "exampile -------------> mail.apple.com"
read HOSTNAME
sudo hostnamectl set-hostname $HOSTNAME --static
sudo hostnamectl set-hostname $HOSTNAME --transient
echo "Enter your IP"
read ip
sudo echo " $ip    $HOSTNAME "  >>  /etc/hosts

sudo yum -y install bind-utils
host $HOSTNAME
dig A $HOSTNAME
sudo yum -y install wget
wget https://github.com/iredmail/iRedMail/releases/download/1.3.1/iRedMail-1.3.1.tar.gz
sudo yum -y install bzip2
tar xvzf iRedMail-1.3.1.tar.gz
cd /root/iRedMail-1.3.1/
echo "recomended choices [nginx,OpenLDAP,mail_domain_name-------> ex: (apple.com)]"
sudo bash iRedMail.sh
