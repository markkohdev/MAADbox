#!/usr/bin/bash

. set_path.sh

sudo apt-get install bundler

vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus
berks install
