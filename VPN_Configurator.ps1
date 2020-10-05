##This script will add the selected client's vpn
###Author: Zach Wilke
###Last Updated: 9.25.2020

#Add needed GUI frameworks
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName PresentationCore,PresentationFramework

#Errors will stop continuation of script
$ErrorActionPreference = 'Stop'

#attempts the following script and logs errors if failed at C:\addvpnerrors.txt
try {

#Elevate Powershell to Admin
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
} 

#Hide powershell window at launch
powershell -windowstyle hidden -command

  #GUI Window
  $form = New-Object System.Windows.Forms.Form
  $form.Text = 'Add a Client VPN'
  $form.Size = New-Object System.Drawing.Size(580,360)
  $form.StartPosition = 'CenterScreen'

  #Ok button
  $okButton = New-Object System.Windows.Forms.Button
  $okButton.Location = New-Object System.Drawing.Point(150,240)
  $okButton.Size = New-Object System.Drawing.Size(100,30)
  $okButton.Text = 'Add'
  $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
  $form.AcceptButton = $okButton
  $form.Controls.Add($okButton)

  #cancel button
  $cancelButton = New-Object System.Windows.Forms.Button
  $cancelButton.Location = New-Object System.Drawing.Point(300,240)
  $cancelButton.Size = New-Object System.Drawing.Size(100,30)
  $cancelButton.Text = 'Cancel'
  $cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
  $form.CancelButton = $cancelButton
  $form.Controls.Add($cancelButton)

  #list label
  $label = New-Object System.Windows.Forms.Label
  $label.Location = New-Object System.Drawing.Point(20,30)
  $label.Size = New-Object System.Drawing.Size(560,40)
  $label.Text = 'Please select a client VPN to add:'
  $form.Controls.Add($label)

  #list
  $listBox = New-Object System.Windows.Forms.ListBox
  $listBox.Location = New-Object System.Drawing.Point(20,80)
  $listBox.Size = New-Object System.Drawing.Size(520,40)
  $listBox.Height = 140

    #listoptions
    [void] $listBox.Items.Add('Option1')
    [void] $listBox.Items.Add('Option2')
    [void] $listBox.Items.Add('Option3')
    [void] $listBox.Items.Add('Option4')
    [void] $listBox.Items.Add('Option5')
    [void] $listBox.Items.Add('Option6')
    [void] $listBox.Items.Add('Option7')


$form.Controls.Add($listBox)

$form.Topmost = $true

$result = $form.ShowDialog()

#list logic
if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $listBox.SelectedItem
    
    #Option1
        if ($x -eq 'Option1') {
        Add-VpnConnection -Name "Option1 VPN" -ServerAddress "0.1.2.3" -TunnelType "Automatic" -EncryptionLevel "Optional" -AuthenticationMethod MSCHAPv2 -SplitTunneling -AllUserConnection -L2tpPsk "presharedkey" -Force -RememberCredential -PassThru
        }

    #Option2
        if ($x -eq 'Option2') {
        Add-VpnConnection -Name "Option2 VPN" -ServerAddress "0.1.2.3" -TunnelType "Automatic" -EncryptionLevel "Optional" -AuthenticationMethod MSCHAPv2 -SplitTunneling -AllUserConnection -L2tpPsk "presharedkey" -Force -RememberCredential -PassThru
        }

    #Option3
        if ($x -eq 'Option3') {
        Add-VpnConnection -Name "Option3 VPN" -ServerAddress "0.1.2.3" -TunnelType "Automatic" -EncryptionLevel "Optional" -AuthenticationMethod MSCHAPv2 -SplitTunneling -AllUserConnection -L2tpPsk "presharedkey" -Force -RememberCredential -PassThru
        }

    #Option4
        if ($x -eq 'Option4') {
        Add-VpnConnection -Name "Option4 VPN" -ServerAddress "0.1.2.3" -TunnelType "Automatic" -EncryptionLevel "Optional" -AuthenticationMethod MSCHAPv2 -SplitTunneling -AllUserConnection -L2tpPsk "presharedkey" -Force -RememberCredential -PassThru
        }
     #Option5
        if ($x -eq 'Option5') {
        Add-VpnConnection -Name "Option5 VPN" -ServerAddress "0.1.2.3" -TunnelType "Automatic" -EncryptionLevel "Optional" -AuthenticationMethod MSCHAPv2 -SplitTunneling -AllUserConnection -L2tpPsk "presharedkey" -Force -RememberCredential -PassThru
        }
    #Option6
        if ($x -eq 'Option6') {
        Add-VpnConnection -Name "Option6 VPN" -ServerAddress "0.1.2.3" -TunnelType "Automatic" -EncryptionLevel "Optional" -AuthenticationMethod MSCHAPv2 -SplitTunneling -AllUserConnection -L2tpPsk "presharedkey" -Force -RememberCredential -PassThru
        }

    #Option7
        if ($x -eq 'Option7') {
        Add-VpnConnection -Name "Option7 VPN" -ServerAddress "0.1.2.3" -TunnelType "Automatic" -EncryptionLevel "Optional" -AuthenticationMethod MSCHAPv2 -SplitTunneling -AllUserConnection -L2tpPsk "presharedkey" -Force -RememberCredential -PassThru
        }
    

#confirm VPN add
[System.Windows.MessageBox]::Show('The VPN connection has been added.', 'Add a Client VPN',0, 64)

}}

catch {
  $_ | Out-File C:\addvpnerrors.txt -Append
  [System.Windows.MessageBox]::Show('An error has occured. The error has been sent to a log file at C:\addvpnerrors.txt.', 'VPN Configuration Failed!',0, 48)
}
