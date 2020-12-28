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

# Configure Kibana to listen on 0.0.0.0
sed -i 's/#server.host: "localhost"/server.host 0.0.0.0/g' /etc/kibana/kibana.yml

systemctl start elasticsearch kibana
echo "running metricbeat and filebeat setup"
metricbeat setup
filebeat setup
metricbeat test output
filebeat test output
systemctl start filebeat metricbeat
