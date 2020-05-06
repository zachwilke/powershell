#First two scripts are done in admin user account
#Prompts for what this computer name should be.
$name = Read-Host -Prompt "What should this computer's name be?"
Rename-Computer $name

#Join a domain
$domain = Read-Host -Prompt "What domain will this computer be on?"
Add-Computer -DomainName $domain

#Now Running Updates
#Install Updates Module
Install-Module -Name PSWindowsUpdate

#Run Windows Updates and auto-reboot
Get-WindowsUpdate -Install -AcceptAll -AutoReboot


Write-Host "
-----------------------------------
Initial Setup and Updates Complete.
-----------------------------------
"