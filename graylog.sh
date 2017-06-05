#!/bin/bash
## Fist shell script for GrayLog Server
sudo apt-get install apt-transport-https openjdk-8-jre-headless uuid-runtime pwgen -y
sudo apt-get install mongodb-server -y
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list
sudo apt-get update && sudo apt-get install elasticsearch
sudo echo "cluster.name: graylog" >> /etc/elasticsearch/elasticsearch.yml
sudo systemctl daemon-reload
sudo systemctl enable elasticsearch.service
sudo systemctl restart elasticsearch.service
wget https://packages.graylog2.org/repo/packages/graylog-2.2-repository_latest.deb
sudo dpkg -i graylog-2.2-repository_latest.deb
sudo apt-get update && sudo apt-get install graylog-server
