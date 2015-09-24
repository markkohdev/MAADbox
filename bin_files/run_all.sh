#!/bin/bash

# Start the webserver
make -C /opt/code/webserver run-bg

# Start the ngapp
make -C /opt/code/ng-app run-bg
