# AutoElastic
Script for automatically rolling out Elastic stack along with Beats

## Supported Linux Versions

Currently only tested and working on Ubuntu version 20. Probably works on 18.04 and 16.04 also.

If your distribution has System-V and Apt-Get, you're probably good.

Working on an OpenSUSE implementation

## Current State  
At the moment, the script installs 
 - Elasticsearch
 - Kibana
 - Filebeat
 - Metricbeat
 
Services are set to be enabled through SystemV
Elasticsearch and Kibana are then started
Filebeat and Metricbeat run their setup commands, then start.

## Note
Need to check if unattended-upgr is running, otherwise apt-get commands won't work
