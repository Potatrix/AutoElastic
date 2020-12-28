# AutoElastic
Script for automatically rolling out Elastic stack along with Beats
## Current State  
At the moment, the script installs 
 - Elasticsearch
 - Kibana
 - Filebeat
 - Metricbeat
 
Services are set to be enabled through SystemV
Elasticsearch and Kibana are then started
Filebeat and Metricbeat run their setup commands, then start.
