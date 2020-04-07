Set-ExecutionPolicy RemoteSigned
$O365Cred = Get-Credential
Import-Module MsOnline
Connect-MsolService –Credential $O365Cred 
$O365Session = New-PSSession –ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell -Credential $O365Cred -Authentication Basic -AllowRedirection
Import-PSSession $O365Session