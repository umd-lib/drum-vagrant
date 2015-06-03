#!/bin/bash

if [ ! -f /apps/solr-env/cores/mdsoar-search ]; then
 ln -s /apps/mdsoar/solr/search /apps/solr-env/cores/mdsoar-search
 ln -s /apps/mdsoar/solr/statistics /apps/solr-env/cores/mdsoar-statistics
 ln -s /apps/mdsoar/solr/oai /apps/solr-env/cores/mdsoar-oai
fi

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
