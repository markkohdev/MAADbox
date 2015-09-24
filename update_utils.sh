#!/bin/bash

echo "===Copying bin/ to VM===";
scp -r bin maadbox:.
ssh maadbox chmod -R 755 /home/vagrant/bin

echo "===Copying provision/ to VM===";
scp -r provision maadbox:.
ssh maadbox chmod -R 755 /home/vagrant/bin

