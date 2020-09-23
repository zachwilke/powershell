#Elevate Powershell to Admin
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))  
{  
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}

#checks execution policy and sets to remote signed if anything else
$execpolicy = Get-ExecutionPolicy

if ($execpolicy -ne 'RemoteSigned') {
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
}

#queries computer data and stores in variable

$computerinfo = Get-ComputerInfo | Select-Object CsName, BiosSerialNumber, WindowsVersion, CsDomain, LogonServer, CsManufacturer, CsModel,  WindowsProductName, BiosBIOSVersion, BiosDescription, BiosFirmwareType, BiosPrimaryBIOS, BiosReleaseDate, CsNetworkAdapters, OsArchitecture, OsTotalVisibleMemorySize, OsTotalVirtualMemorySize, OsFreeVirtualMemory, OsSuites

#Pop up for File Location
                        Add-Type -AssemblyName System.Windows.Forms
                        Add-Type -AssemblyName System.Drawing

                        $form = New-Object System.Windows.Forms.Form
                        $form.Text = 'Exported Data File Location'
                        $form.Size = New-Object System.Drawing.Size(300,200)
                        $form.StartPosition = 'CenterScreen'

                        $okButton = New-Object System.Windows.Forms.Button
                        $okButton.Location = New-Object System.Drawing.Point(75,120)
                        $okButton.Size = New-Object System.Drawing.Size(75,23)
                        $okButton.Text = 'OK'
                        $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
                        $form.AcceptButton = $okButton
                        $form.Controls.Add($okButton)

                        $cancelButton = New-Object System.Windows.Forms.Button
                        $cancelButton.Location = New-Object System.Drawing.Point(150,120)
                        $cancelButton.Size = New-Object System.Drawing.Size(75,23)
                        $cancelButton.Text = 'Cancel'
                        $cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
                        $form.CancelButton = $cancelButton
                        $form.Controls.Add($cancelButton)

                        $label = New-Object System.Windows.Forms.Label
                        $label.Location = New-Object System.Drawing.Point(10,20)
                        $label.Size = New-Object System.Drawing.Size(280,20)
                        $label.Text = 'File Location (ex. C:\users\*currentuser*\Desktop):'
                        $form.Controls.Add($label)

                        $textBox = New-Object System.Windows.Forms.TextBox
                        $textBox.Location = New-Object System.Drawing.Point(10,40)
                        $textBox.Size = New-Object System.Drawing.Size(260,20)
                        $form.Controls.Add($textBox)

                        $form.Topmost = $true

                        $form.Add_Shown({$textBox.Select()})
                        $result = $form.ShowDialog()

                        if ($result -eq [System.Windows.Forms.DialogResult]::OK)
                        {
                            $x = $textBox.Text
                        }


#sends stored variable to file location
$computerinfo | Out-File -FilePath $x\computerinformation.txt


$a = new-object -comobject wscript.shell 
$intAnswer = $a.popup("Do you want to open the exported data file?", 
0,"Open",4) 
If ($intAnswer -eq 6) { 
    Invoke-Item "$x\ComputerInformation.txt"
}
else { 
    $a.popup("Script Complete ComputerInformation.txt can be found at $x\ComputerInformation.txt") 
} 
  
#Button Types  
# 
#Value  Description   
#0 Show OK button. 
#1 Show OK and Cancel buttons. 
#2 Show Abort, Retry, and Ignore buttons. 
#3 Show Yes, No, and Cancel buttons. 
#4 Show Yes and No buttons. 
#5 Show Retry and Cancel buttons.

