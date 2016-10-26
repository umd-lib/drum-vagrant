#!/bin/bash

if [ ! -h /apps/solr-env/cores/drum-search ]; then
 ln -s /apps/drum/solr/search /apps/solr-env/cores/drum-search
 ln -s /apps/drum/solr/statistics /apps/solr-env/cores/drum-statistics
 ln -s /apps/drum/solr/oai /apps/solr-env/cores/drum-oai
 cp -f /vagrant/app-config/solr.xml /apps/solr-env/jetty/solr.xml
 cd /apps/solr-env/jetty/
 ./control restart
fi
