@'
Install-WindowsFeature -name Web-Server -IncludeManagementTools
Set-Content -Path "C:\inetpub\wwwroot\Default.htm" -Value "Hello from $(hostname)"
'@ | Out-File -FilePath install-iis.ps1 -Encoding ascii