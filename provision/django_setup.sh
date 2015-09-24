#!/bin/bash

# Install Django
pip install Django==1.8.3 >> /var/log/django_provision.log

# Install everything that we need to Django
pip install djangorestframework >> /var/log/django_provision.log
pip install markdown >> /var/log/django_provision.log
pip install django-filter >> /var/log/django_provision.log

# Anything else we need to do

