#!/bin/bash

# deploy DSpace
cd /apps/git/mdsoar/dspace/target/dspace-installer
ant fresh_install

# restart Tomcat
if [ ! -z "$(lsof -iTCP:8080)" ]; then
    /apps/tomcat/bin/shutdown.sh
    sleep 5
fi
/apps/tomcat/bin/startup.sh
