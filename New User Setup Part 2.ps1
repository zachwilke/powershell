#Connect to VPN and sign in as the user. Following scripts done in User account.

#Map Drive

$domain = Read-Host -Prompt "What is the user's domain?"
$username = Read-Host -Prompt "What is this user's username?"
$Credential = Get-Credential $domain\$username
$oldip = Read-Host -Prompt "What is the IP of the Old PC?"


$conf = Read-Host "Would you like to map the user's network drives (y/n)?"
if ($conf -eq 'y')
{
net use u: \\file location\file /user:$domain\$username $Credential /PERSISTENT:yes

net use s: \\file location\file /user:$domain\$username $Credential /PERSISTENT:yes

net use p: \\file location\file /user:$domain\$username $Credential /PERSISTENT:yes
}
if ($conf -eq 'n')
{
    Write-Error "
        --------------------
        Drive Mapping Denied
        --------------------
    "
}

#Asks if you want to transfer files
$confone = Read-Host "Would you like to transfer the user's files (y/n)?"
if ($confone -eq 'y') 
    {
        #Transfer Files to New PC

            #List Desktop Folder
            robocopy "\\$oldip\c$\Users\$username\Desktop" "c:\Users\$username\Desktop" /e /w:1 /r:1 /L
            #List Documents Folder
            robocopy "\\$oldip\c$\Users\$username\Documents" "c:\Users\$username\Documents" /e /w:1 /r:1 /L
            #List Favorites Folder
            robocopy "\\$oldip\c$\Users\$username\favorites" "c:\Users\$username\Favorites" /e /w:1 /r:1 /L
            #List Downloads Folder
            robocopy "\\$oldip\c$\Users\$username\Downloads" "c:\Users\$username\Downloads" /e /w:1 /r:1 /L
            #List Pictures Folder
            robocopy "\\$oldip\c$\Users\$username\Pictures" "c:\Users\$username\pictures" /e /w:1 /r:1 /L
        
    
        #Asks for confirmation of copy
    $conftwo = Read-Host "Are you Sure You Want To Proceed with the transfer (y/n)?"
    if ($conftwo -eq 'y') 
        {
            #Copy Desktop Folder
            robocopy "\\$oldip\c$\Users\$username\Desktop" "c:\Users\$username\Desktop" /e /w:1 /r:1
            #Copy Documents Folder
            robocopy "\\$oldip\c$\Users\$username\Documents" "c:\Users\$username\Documents" /e /w:1 /r:1
            #Copy Favorites Folder
            robocopy "\\$oldip\c$\Users\$username\favorites" "c:\Users\$username\Favorites" /e /w:1 /r:1
            #Copy Downloads Folder
            robocopy "\\$oldip\c$\Users\$username\Downloads" "c:\Users\$username\Downloads" /e /w:1 /r:1
            #Copy Pictures Folder
            robocopy "\\$oldip\c$\Users\$username\Pictures" "c:\Users\$username\pictures" /e /w:1 /r:1

            Write-Host "
            --------------------------------------
            File Transfer Complete. Setup Complete
            --------------------------------------
            "
        }
    }
    if ($conftwo -eq 'n')
    {
        Write-Error "
        -----------------------
        File Transfer Denied. 
        -----------------------
        "
        Write-Host "
        --------------
        Setup complete
        --------------
        "
    }
if ($confone -eq 'n')
    {
        Write-Error "
        -----------------------
        File Transfer Denied. 
        -----------------------
        "
        Write-Host "
        --------------
        Setup complete
        --------------
        "
    }


