#!/bin/bash

# Add mdsoar solr cores, if it does not exist already.
/vagrant/scripts/mdsoar-solr-cores.sh

if [ -z `pgrep -f jetty:run` ]; then
 /apps/solr-env/jetty/control start
fi

cd /apps/mdsoar/tomcat
 ./control stop

# deploy DSpace
cd /apps/mdsoar/dspace-installer
ant update_local

cd /apps/mdsoar/tomcat
 ./control start 
