#!/bin/bash

# write the context config files for DSpace

mkdir -p /apps/apache-tomcat-7.0.61/conf/Catalina/localhost
for APP in jspui oai rdf rest solr sword swordv2 xmlui; do
    cat > "/apps/apache-tomcat-7.0.61/conf/Catalina/localhost/${APP}.xml" <<XML
<?xml version='1.0'?>
<Context
    docBase="/apps/mdsoar/webapps/${APP}"
    reloadable="true"
    cachingAllowed="false"/>
XML
done

cat > "/apps/apache-tomcat-7.0.61/conf/Catalina/localhost/ROOT.xml" <<XML
<?xml version='1.0'?>
<Context
    docBase="/apps/mdsoar/webapps/xmlui"
    reloadable="true"
    cachingAllowed="false"/>
XML

chown -R vagrant:vagrant /apps/apache-tomcat-7.0.61/conf/Catalina
