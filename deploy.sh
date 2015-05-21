#!/bin/bash

# deploy DSpace
cd /apps/mdsoar/dspace-installer
ant update_local

cd /apps/mdsoar/tomcat
./control restart
