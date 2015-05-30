#!/bin/bash

cd /apps/mdsoar/tomcat
 ./control stop

# deploy DSpace
cd /apps/mdsoar/dspace-installer
ant update_local

cd /apps/mdsoar/tomcat
 ./control start 
