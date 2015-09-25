#!/usr/bin/bash

. set_path.sh

sudo apt-get install -y bundler

vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus
berks install
