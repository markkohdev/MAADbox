#!/bin/bash

# Install required python modules
sudo pip install -r /opt/code/webserver/requirements.txt >> /var/log/webserver_provision.log

# Create database tables
make -C /opt/code/webserver syncdb >> /var/log/webserver_provision.log
