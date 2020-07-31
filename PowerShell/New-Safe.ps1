# Confirming that the psPAS and CredentialRetriever PowerShell Modules are installed on the machine.
Install-Module psPAS
Install-Module CredentialRetriever
# Retrieving the Credential to be used to create the new safe via Central Credential Provider.
$result = Get-CCPCredential -AppID App -Safe Safe -Object ObjectName -URL https://pvwa
$result.ToCredential()
$user = $result.ToCredential().username
$pass = $result.ToCredential().content
# Creating session to CyberArk to create safe with credentials retrieved from Central Credential Provider.
New-PASSession -Credential $result -BaseURI https://pvwa
# Creating a new safe.
Add-PASSafe -SafeName  -Description C7 -ManagingCPM PasswordManager -NumberOfDaysRetention 7
# Adding the Vault Admins group to the safe members with all permissions.
Add-PASSafeMember -SafeName  -MemberName "Vault Admins" -SearchIn Vault -UseAccounts $true -RetrieveAccounts $true -ListAccounts $true -AddAccounts $true -UpdateAccountContent $true -UpdateAccountProperties $true -InitiateCPMAccountManagementOperations $true -SpecifyNextAccountContent $true -RenameAccounts $true -DeleteAccounts $true -UnlockAccounts $true -ManageSafe $true -ManageSafeMembers $true -BackupSafe $true -ViewAuditLog $true -ViewSafeMembers $true -AccessWithoutConfirmation $true -CreateFolders $true -DeleteFolders $true -MoveAccountsAndFolders $true   
# Adding Second Vault Admins group to the safe members with all permissions.
Add-PASSafeMember -SafeName  -MemberName "Safe Admins" -SearchIn domain -UseAccounts $true -RetrieveAccounts $true -ListAccounts $true -AddAccounts $true -UpdateAccountContent $true -UpdateAccountProperties $true -InitiateCPMAccountManagementOperations $true -SpecifyNextAccountContent $true -RenameAccounts $true -DeleteAccounts $true -UnlockAccounts $true -ViewAuditLog $true -ViewSafeMembers $true -AccessWithoutConfirmation $true -MoveAccountsAndFolders $true          
# Adding the safe user LDAP based group to the safe members.
# TODO: Define new user permissions.
Add-PASSafeMember -SafeName  -MemberName "" -SearchIn domain -UseAccounts $true -RetrieveAccounts $true -ListAccounts $true -AddAccounts $true -UpdateAccountContent $true -UpdateAccountProperties $true -InitiateCPMAccountManagementOperations $true -SpecifyNextAccountContent $true -RenameAccounts $true -DeleteAccounts $true -UnlockAccounts $true -ViewAuditLog $true -ViewSafeMembers $true -AccessWithoutConfirmation $true -MoveAccountsAndFolders $true       
# Removing the User from the safe members that created the safe.
Remove-PASSafeMember -SafeName  -MemberName    

