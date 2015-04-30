#!/bin/bash

# deploy DSpace
cd /apps/mdsoar/src/dspace/target/dspace-installer
ant fresh_install

cd /apps/mdsoar/tomcat
./control restart
