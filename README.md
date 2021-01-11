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

## Note
Need to check if unattended-upgr is running, otherwise apt-get commands won't work

## AutoBeats.ps1
This .ps1 script was created to automatically install Winlogbeat and Metricbeat on Windows Hosts using Powershell.

### Running the Script
Powershell is a bit antsy when it comes to running scripts that you downloaded. If the script is not signed with a trusted certificate (this one isn't) it might complain  
and not let you run it.

It will also complain about your Execution Policy settings if the script is doing an administrative task.  

For transparency on what the script is doing I will lay out all of the necessary steps for installing Winlogbeat and Metricbeat on your Windows endpoint.  
That way you may perform the steps manually if you wish, the script will just do the same tasks for you.

1. Download Winlogbeat and Metricbeat ZIP Files

Metricbeat can be found here: https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.10.1-windows-x86_64.zip  
Winlogeat can be found here: https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-7.10.1-windows-x86_64.zip  

2. Extract the ZIP Files  
Extract the files in your Downloads folder  

3. Edit the Config files  
For Winlogbeat this is the winlogbeat.yml file  
for Metricbeat this is the metricbeat.yml file  

More to add yet, stay tuned