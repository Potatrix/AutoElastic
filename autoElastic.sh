#!/bin/bash

# Grab apt-transport-https
echo "downloading Elasticsearch"
apt-get install apt-transport-https

# add gpg key
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

# add repo
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list

# update and install
apt-get update

apt-get install elasticsearch kibana filebeat metricbeat

echo "enabling Elasticsearch, kibana, filebeat, and metricbeat"
systemctl enable elasticsearch kibana filebeat metricbeat

echo "running metricbeat and filebeat setup"
metricbeat setup
filebeat setup
