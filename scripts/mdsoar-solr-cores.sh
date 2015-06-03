#!/bin/bash

if [ ! -h /apps/solr-env/cores/mdsoar-search ]; then
 ln -s /apps/mdsoar/solr/search /apps/solr-env/cores/mdsoar-search
 ln -s /apps/mdsoar/solr/statistics /apps/solr-env/cores/mdsoar-statistics
 ln -s /apps/mdsoar/solr/oai /apps/solr-env/cores/mdsoar-oai
 cp -f /vagrant/app-config/solr.xml /apps/solr-env/jetty/solr.xml
 cd /apps/solr-env/jetty/
 ./control restart
fi
