###Calendar Permission Edit###
###Published by Zach Wilke on 03.23.2021###
###https://https://github.com/zachwilke###


#variables needed for options
$targetmbx = Read-Host -Prompt "What is the email of the target mailbox?"
$delegatembx = Read-Host -Prompt "What is the email of the user getting delegated access?"
$permissionlvl = Read-Host -Prompt "What permission level should the delegated user receive?

-----
a. Author:
- CreateItems
- DeleteOwnedItems
- EditOwnedItems
- FolderVisible
- ReadItems

b. Contributor: 
- CreateItems
- FolderVisible

c. Editor: 
- CreateItems
- DeleteAllItems
- DeleteOwnedItems
- EditAllItems
- EditOwnedItems
- FolderVisible
- ReadItems 

d. Owner:
- CreateItems
- CreateSubfolders
- DeleteAllItems
- DeleteOwnedItems
- EditAllItems
- EditOwnedItems
- FolderContact
- FolderOwner
- FolderVisible
- ReadItems

e. PublishingEditor:
- CreateItems
- CreateSubfolders
- DeleteAllItems
- DeleteOwnedItems
- EditAllItems
- EditOwnedItems
- FolderVisible
- ReadItems

f. PublishingAuthor:
- CreateItems
- CreateSubfolders
- DeleteOwnedItems
- EditOwnedItems
- FolderVisible
- ReadItems

g. Reviewer: 
- FolderVisible
- ReadItems

h. NonEditingAuthor:
- CreateItems
- FolderVisible
- ReadItem

i. None:
- FolderVisible

---------------------------------------------------------------------

Place Selection Here"

#conditional execution based on letter selection listed in variable targetmbx.

if ($permissionlvl -eq 'a') {
    Set-MailboxFolderPermission -Identity ${targetmbx}:\Calendar -User $delegatembx -AccessRights Author
}

if ($permissionlvl -eq 'b') {
    Set-MailboxFolderPermission -Identity ${targetmbx}:\Calendar -User $delegatembx -AccessRights Contributor
}

if ($permissionlvl -eq 'c') {
    Set-MailboxFolderPermission -Identity ${targetmbx}:\Calendar -User $delegatembx -AccessRights Editor
}

if ($permissionlvl -eq 'd') {
    Set-MailboxFolderPermission -Identity ${targetmbx}:\Calendar -User $delegatembx -AccessRights Owner
}

if ($permissionlvl -eq 'e') {
    Set-MailboxFolderPermission -Identity ${targetmbx}:\Calendar -User $delegatembx -AccessRights PublishingEditor
}

if ($permissionlvl -eq 'f') {
    Set-MailboxFolderPermission -Identity ${targetmbx}:\Calendar -User $delegatembx -AccessRights PublishingAuthor
}

if ($permissionlvl -eq 'g') {
    Set-MailboxFolderPermission -Identity ${targetmbx}:\Calendar -User $delegatembx -AccessRights Reviewer
}

if ($permissionlvl -eq 'h') {
    Set-MailboxFolderPermission -Identity ${targetmbx}:\Calendar -User $delegatembx -AccessRights NonEditingAuthor
}

if ($permissionlvl -eq 'i') {
    Set-MailboxFolderPermission -Identity ${targetmbx}:\Calendar -User $delegatembx -AccessRights None
}

