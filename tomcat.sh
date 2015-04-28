#!/bin/bash

CONTEXT_DIR=/apps/tomcat/conf/Catalina/localhost

# write the context config files for DSpace
mkdir -p "$CONTEXT_DIR"
for APP in jspui oai rdf rest solr sword swordv2 xmlui; do
    cat > "$CONTEXT_DIR/${APP}.xml" <<XML
<?xml version='1.0'?>
<Context
    docBase="/apps/mdsoar/webapps/${APP}"
    reloadable="true"
    cachingAllowed="false"/>
XML
done

# use the xmlui webapp as the root
cp "$CONTEXT_DIR/xmlui.xml" "$CONTEXT_DIR/ROOT.xml"

# environment variables for Tomcat's startup
cp /vagrant/setenv.sh /apps/tomcat/bin
