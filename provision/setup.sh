#!/bin/bash

export WEBSERVER_ROOT=/opt/code/django/
export NGAPP_ROOT=/opt/code/angular/

# Copy provison and bin to ~/vagrant
rm -rf /home/vagrant/provision /home/vagrant/bin
cp -R /tmp/provision /home/vagrant/provision
cp -R /tmp/bin /home/vagrant/bin
rm -rf /tmp/provision /tmp/bin

# Install django necessities
#bash /home/vagrant/provision/django_setup.sh

# Install angular necessities
#bash /home/vagrant/provision/angular_setup.sh

# Make any directories that we need and set permissions
mkdir -p /opt/code
chmod 755 /opt/code
chmod 755 /home/vagrant/bin/*
chown -R vagrant /opt/code

# Make it so we're not prompted about RSA authentication for git
echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> /home/vagrant/.ssh/config
echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

# Clone repos
# if [ ! -d "$WEBSERVER_ROOT" ]; then
# 	git clone git@github.com:Booksmart/django-api-seed.git $WEBSERVER_ROOT
# fi

# if [ ! -d "$NGAPP_ROOT" ]; then
#   git clone git@github.com:markohdev/angular-seed.git $NGAPP_ROOT
# fi

# Install bash conveniences
if [ ! -f /home/vagrant/.bash_additions ]; then
	echo '. ~/.bash_additions' >> /home/vagrant/.bashrc
fi
cp /home/vagrant/provision/.bash_additions /home/vagrant/

# Give vagrant ownership of things that vagrant needs
chown -R vagrant /home/vagrant/bin
chown -R vagrant /home/vagrant/provision
chown vagrant /home/vagrant/.bash_additions

# Set up local database
# bash /home/vagrant/bin/database_setup.sh

# Set up webserver
# bash /home/vagrant/bin/webserver_setup.sh
