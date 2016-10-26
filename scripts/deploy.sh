#!/bin/bash

# Add drum solr cores, if it does not exist already.
/vagrant/scripts/drum-solr-cores.sh

if [ -z `pgrep -f jetty:run` ]; then
 /apps/solr-env/jetty/control start
fi

cd /apps/drum/tomcat
 ./control stop

# deploy DSpace
cd /apps/drum/dspace-installer
ant update_local

cd /apps/drum/tomcat
 ./control start 
