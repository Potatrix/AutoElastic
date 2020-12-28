#!/bin/bash

# Grab apt-transport-https
echo "downloading Elasticsearch"
apt-get install apt-transport-https

echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-7.x.list

sudo apt-get update

sudo apt-get install elasticsearch kibana filebeat metricbeat

echo "enabling Elasticsearch, kibana, filebeat, and metricbeat"
sudo systemctl enable elasticsearch kibana filebeat metricbeat

echo "running metricbeat and filebeat setup"
sudo metricbeat setup
sudo filebeat setup
