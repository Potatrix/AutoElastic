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
systemctl enable elasticsearch kibana filebeat metricbeat auditbeat

# Configure Kibana to listen on 0.0.0.0
sed -i 's/#server.host: "localhost"/server.host: 0.0.0.0/g' /etc/kibana/kibana.yml

# Configure Elasticsearch to listen on 0.0.0.0
sed -i 's/#cluster.initial_master_nodes: ["node-1", "node-2"]/cluster.initial_master_nodes: ["node1"]/g' /etc/elasticsearch/elasticsearch.yml

sed -i 's/#network.host: 192.168.0.1/network.host: 0.0.0.0/g'

echo "How many GB of RAM do you want Elasticsearch to use? (Recommend no more than 80% total RAM, and not more than 32GB): "

read ramGigs

sed -i "s/-Xms1g/-Xms$ramGigs\g/g" /etc/elasticsearch/jvm.options
sed -i "s/-Xmx1g/-Xmx$ramGigs\g/g" /etc/elasticsearch/jvm.options
systemctl start elasticsearch kibana
echo "running metricbeat and filebeat setup"
metricbeat setup
filebeat setup
auditbeat setup
metricbeat test output
filebeat test output
auditbeat test output
systemctl start filebeat metricbeat auditbeat
