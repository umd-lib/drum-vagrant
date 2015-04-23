#!/bin/bash

# EPEL 6: rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# not needed?

# Oracle JDK
if [ ! -e /vagrant/jdk-7u75-linux-x64.tar.gz ]; then
    echo >&2 "No JDK found. Please download the Oracle JDK and place it in this directory."
    exit 1
fi
tar xzvf /vagrant/jdk-7u75-linux-x64.tar.gz -C /apps

# Maven
# not needed on vagrant guest?

# Ant
ANT_PKG_URL=http://apache.osuosl.org/ant/binaries/apache-ant-1.9.4-bin.tar.gz
wget -O - "$ANT_PKG_URL" | tar xvzf - -C /apps


# Tomcat
TOMCAT_PKG_URL=http://apache.osuosl.org/tomcat/tomcat-7/v7.0.61/bin/apache-tomcat-7.0.61.tar.gz
wget -O - "$TOMCAT_PKG_URL" | tar xvzf - -C /apps
chown -R vagrant:vagrant /apps/apache-tomcat-7.0.61
cp /vagrant/setenv.sh /apps/apache-tomcat-7.0.61/bin

# Puppet Modules
puppet module install puppetlabs-firewall
puppet module install puppetlabs-postgresql
