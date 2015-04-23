#!/bin/bash

sudo mkdir -p /apps/mdsoar
sudo chown vagrant:vagrant /apps/mdsoar

cd /apps/git/mdsoar/dspace/target/dspace-installer
/apps/apache-ant-1.9.4/bin/ant fresh_install

cp -R /apps/mdsoar/webapps/* /apps/apache-tomcat-7.0.61/webapps
/apps/apache-tomcat-7.0.61/bin/startup.sh
