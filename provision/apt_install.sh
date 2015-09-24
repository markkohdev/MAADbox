#!/bin/bash

# Install all apt-get stuff
echo "Getting latest versions"
apt-get update >> /var/log/apt_provision.log

echo "Installing Apache"
apt-get install -y apache2 >> /var/log/apt_provision.log

echo "Installing Git"
apt-get install -y git >> /var/log/apt_provision.log

echo "Preparing MySQL"
apt-get install -y debconf-utils >> /var/log/apt_provision.log
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

echo "Installing MySQL"
apt-get install -y mysql-server >> /var/log/apt_provision.log

echo "Installing MySQL client library"
apt-get install -y libmysqlclient-dev >> /var/log/apt_provision.log

echo "Installing Python Dev"
apt-get install -y python-dev >> /var/log/apt_provision.log

echo "Installing Ruby"
apt-get install -y ruby-dev >> /var/log/apt_provision.log

echo "Installing Node"
apt-get install -y nodejs >> /var/log/apt_provision.log

echo "Installing NPM"
apt-get install -y npm >> /var/log/apt_provision.log

echo "Installing pip"
apt-get install -y python-pip >> /var/log/apt_provision.log
