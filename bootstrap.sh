#!/bin/bash

# EPEL 6: rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# not needed?

# Oracle JDK
JDK=$(find /vagrant/dist -maxdepth 1 -type f -name 'jdk-*.tar.gz' | tail -n1)
if [ -z "$JDK" ]; then
    echo >&2 "No JDK found. Please download an Oracle JDK tar.gz and place it in [vagrant]/dist"
    exit 1
fi
echo "Found JDK in $JDK"
tar xzvf "$JDK" -C /apps 
cat > /etc/profile.d/mdsoar.sh <<END
export JAVA_HOME=$(find /apps -maxdepth 1 -type d -name 'jdk*' | tail -n1)
export PATH=\$JAVA_HOME/bin:/apps/ant/bin:\$PATH
END

# Maven
# not needed on vagrant guest?

# Ant
# can't install via yum since that is only version 1.7.1
ANT_PKG_URL=http://apache.osuosl.org/ant/binaries/apache-ant-1.9.4-bin.tar.gz
mkdir -p /apps/ant
wget -q -O - "$ANT_PKG_URL" | tar xvzf - --strip-components 1 --directory /apps/ant


# Tomcat
# can't install via yum since that is only version 6.0.24
mkdir -p /apps/tomcat
# look for a cached tarball
TOMCAT=$(find /vagrant/dist -maxdepth 1 -type f -name 'apache-tomcat-*.tar.gz' | tail -n1)
if [ -z "$TOMCAT" ]; then
    TOMCAT_VERSION=7.0.61
    TOMCAT_PKG_URL=http://apache.osuosl.org/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz
    TOMCAT=/vagrant/dist/apache-tomcat-${TOMCAT_VERSION}.tar.gz
    wget -q -O "$TOMCAT" "$TOMCAT_PKG_URL"
fi
tar xvzf "$TOMCAT" --strip-components 1 --directory /apps/tomcat
chown -R vagrant:vagrant /apps/tomcat

# Puppet Modules
puppet module install puppetlabs-firewall
puppet module install puppetlabs-postgresql
