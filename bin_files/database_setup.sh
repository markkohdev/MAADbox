#!/bin/bash

Q1="CREATE DATABASE IF NOT EXISTS maadbox;"
mysql -uroot -proot -e "$Q1"
echo "Database maadbox created"

Q2="GRANT ALL ON *.* TO 'maadbox'@'localhost' IDENTIFIED BY 'password';"
mysql -uroot -proot -e "$Q2"
echo "User maadbox with password 'password' created"

Q3="FLUSH PRIVILEGES;"
mysql -uroot -proot -e "$Q3"
