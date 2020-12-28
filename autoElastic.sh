#!/bin/bash

# Grab apt-transport-https
echo "downloading Elasticsearch"
apt-get install apt-transport-https

echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list

apt-get update

apt-get install elasticsearch kibana filebeat metricbeat

echo "enabling Elasticsearch, kibana, filebeat, and metricbeat"
systemctl enable elasticsearch kibana filebeat metricbeat

echo "running metricbeat and filebeat setup"
metricbeat setup
filebeat setup
