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
export PATH=\$JAVA_HOME/bin:\$PATH
END

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
