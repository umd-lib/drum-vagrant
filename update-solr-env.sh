#!/bin/bash

# Set up solr
mkdir -p /apps/solr-env/
cp -r /apps/solr-env-sync/* /apps/solr-env/
ln -s /apps/mdsoar/solr/search /apps/solr-env/cores/mdsoar-search
ln -s /apps/mdsoar/solr/statistics /apps/solr-env/cores/mdsoar-statistics
ln -s /apps/mdsoar/solr/oai /apps/solr-env/cores/mdsoar-oai
cp -f /vagrant/dist/solr.xml /apps/solr-env/jetty/solr.xml
cp /vagrant/dist/solr /etc/init.d/solr

chown -R vagrant:vagrant /apps
