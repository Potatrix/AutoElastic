Write-Host "Downloading ZIP files"
wget https://artifacts.elastic.co/downloads/beats/winlogbeat/winlogbeat-7.10.1-windows-x86_64.zip -UseBasicParsing -OutFile ~\Downloads\Winlogbeat.zip
wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.10.1-windows-x86_64.zip -UseBasicParsing -OutFile ~\Downloads\Metricbeat.zip

write-host "Unzipping files"
Expand-Archive ~\Downloads\Winlogbeat.zip -DestinationPath ~\downloads\Winlogbeat
Expand-Archive ~\Downloads\Metricbeat.zip -DestinationPath ~\downloads\Metricbeat

$IP = Read-Host -Prompt "What is the IP Address of your Elastic Stack?: "
$IPHostString = 'hosts: [' + $IP + ':9200"]'

Write-Host "writing up config"

((Get-Content ~\Downloads\Winlogbeat\*\winlogbeat.yml).replace('hosts: ["localhost:9200"]', $IPHostString) | Set-Content -Path .\winlogbeat2.yml)
((Get-Content ~\Downloads\Metricbeat\*\metricbeat.yml).replace('hosts: ["localhost:9200"]', $IPHostString) | Set-Content -Path .\metricbeat2.yml)

# Move files to appropriate place
Write-Host "moving files to appropriate place"
Move-Item -Path "~\Downloads\Winlogbeat\*" -Destination "~\Downloads\Winlogbeat2"
Move-Item -Path "~\Downloads\Metricbeat\*" -Destination "~\Downloads\Metricbeat2"