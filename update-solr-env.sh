#!/bin/bash

# Set up solr
mkdir -p /apps/solr-env/
cp -r /apps/solr-env-sync/* /apps/solr-env/
ln -s /apps/mdsoar/solr/search /apps/solr-env/cores/mdsoar-search
ln -s /apps/mdsoar/solr/statistics /apps/solr-env/cores/mdsoar-statistics
ln -s /apps/mdsoar/solr/oai /apps/solr-env/cores/mdsoar-oai
cp -f /vagrant/app-config/solr.xml /apps/solr-env/jetty/solr.xml
cp /vagrant/app-config/solr-init /etc/init.d/solr
chkconfig --add solr
export JAVA_HOME=/apps/java/
export PATH=$JAVA_HOME/bin:/apps/ant/bin:$PATH
export M2_HOME=/apps/apache-maven-3.2.5
export PATH=${M2_HOME}/bin:${PATH}
cd /apps/solr-env/jetty
mvn keytool:clean keytool:generateKeyPair
sudo /apps/java/bin/keytool -importkeystore -srckeystore src/main/config/jetty-ssl.keystore -srcstorepass jetty8 -destkeystore $JAVA_HOME/jre/lib/security/cacerts -deststorepass changeit
chown -R vagrant:vagrant /apps

