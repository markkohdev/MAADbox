#!/usr/bin/bash

cat set_path.sh >> ~/.bashrc
source ~/.bashrc 

sudo apt-get install -y bundler

vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-omnibus
berks install
