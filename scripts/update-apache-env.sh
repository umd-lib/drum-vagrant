#!/bin/bash

# Vagrant drum environment is a little bit different from drum server environment.

# Change for apache
## Turn off SSL
sed -i -e 's/^  SSL/# SSL/g' /apps/drum/apache/conf.d/00-virtualhosts.conf

## Remove qos module
rm /apps/drum/apache/conf.modules.d/01-qos.conf

## Change user and group for Makefile
sed -i -e 's/drum/vagrant/g' /apps/drum/apache/src/Makefile
