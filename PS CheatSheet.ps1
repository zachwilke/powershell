#Rename a computer
Rename-Computer examplename

#Restart a computer
Restart-Computer

#Shutdown a computer
Stop-Computer

#Get IP address
Get-NetIPConfiguration

#Set an IP address
New-NetIPAddress –InterfaceAlias “Wired Ethernet Connection” –IPv4Address “192.168.0.1” –PrefixLength 24 -DefaultGateway 192.168.0.254

#Configure DNS server
Set-DNSClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 1.1.1.1

#Join a domain
Add-Computer -DomainName example.local

#Get network adapter names
Get-NetAdapter

#Verify network adapter functionality
Get-NetAdapterStatistics

#Verify Network Adapter Connectivity (This is a combo of ping and traceroute)
Test-NetConnection
#or test with IP address
Test-NetConnection 8.8.8.8
#or test with URL and include route taken
Test-NetConnection google.com -TraceRoute
#or test protocol specifying the port connection
Test-NetConnection smtp.com -Port 25

#Repair Trust Relationship (log in with admin account and run)
Test-ComputerSecureChannel -credential domain\admin -Repair

#Error Event Logs
Get-Eventlog -logname System -EntryType Error

#Manage Services
Stop-Service
Start-Service
Restart-Service
Set-Service
Get-Service

#View Stopped Services
Get-Service | Where-Object {$_.Status -eq "Stopped"}

#Ready a Secure Password (so it can be assigned to user)
$newpwd = ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force
#Reset Password & Force Change
Set-ADAccountPassword name.name -NewPassword $newpwd -Reset -PassThru | Set-ADuser -ChangePasswordAtLogon $true
#Search for accounts on domain with non-expiring passwords
Search-ADAccount -PasswordNeverExpires
#Search for accounts that haven't signed-on for 90 days
Search -ADAccount -accountinactive -timespan 90.00.00.00
#Search for locked out accounts
Search-AdAccount -Lockedout
#Search for disabled accounts
Search-ADAccount -AccountDisabled

#New User
New-ADUser -Name name.name -AccountPassword $newpwd
#Enable New User
Enable-ADAccount -Identity name.name
#New Group
New-ADGroup -Name "name" -SamAccountName name -GroupCategory Security -GroupScope Global -Path "CN=Users,DC=domainname,DC=domaintype"

#New File Share
New-SMBShare -Name SharedFolder -Path C:\SharedFolder - FullAccess domain\Administrator -ReadAccess domain\name.name

#Add Roles and Features
Install-WindowsFeature -IncludeAllSubfeature -IncludeManagementTools File-Services

#Add Roles .NET Framework
Install-WindowsFeature Net-Framework-Core -source d:\sources\sxs

#View Installed Updates
Get-HotFix

#Add Firewall Rules Allow
New-NetFirewallRule -DisplayName "Allow Inbound Port 80" -Direction Inbound - LocalPort 80 -Protocol TCP -Action Allow

#Get PS to talk to you... Literally....
Add-Type –AssemblyName System.Speech
$talk = New-Object –TypeName System.Speech.Synthesis.SpeechSynthesizer
$talk.Speak('Hello, Take me to your leader.')
