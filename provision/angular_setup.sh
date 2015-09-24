#!/bin/bash

# Install angular, 
npm install -g yo >> /var/log/angular_provision.log
npm install -g bower  >> /var/log/angular_provision.log
npm install -g gulp >> /var/log/angular_provision.log
npm install -g generator-karma >> /var/log/angular_provision.log
npm install -g generator-angular >> /var/log/angular_provision.log

if [ ! -f /usr/bin/node ]; then
	ln -s /usr/bin/nodejs /usr/bin/node
fi

# Get us that sassy stuff
gem install sass >> /var/log/angular_provision.log
gem install compass >> /var/log/angular_provision.log
