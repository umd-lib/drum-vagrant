#!/bin/bash

# Vagrant drum environment is a little bit different from drum server environment.

## Change the apache user/group from drum to vagrant
sed -i -e 's/User drum/User vagrant/g' /apps/drum/apache/conf/httpd.conf
sed -i -e 's/Group drum/Group vagrant/g' /apps/drum/apache/conf/httpd.conf

## Turn off SSL
sed -i -e 's/^  SSL/# SSL/g' /apps/drum/apache/conf.d/00-virtualhosts.conf

# Remove qos module
rm /apps/drum/apache/conf.modules.d/01-qos.conf

