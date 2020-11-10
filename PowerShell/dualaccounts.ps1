#//TODO: Convert script to use psPAS.

<#

- Read host for SafeName.
- Read host for account name.
- Read host for Prod or Test


# Confirming that the psPAS and CredentialRetriever PowerShell Modules are installed on the machine.
Install-Module psPAS
Install-Module CredentialRetriever
# Retrieving the Credential to be used to create the new safe via Central Credential Provider.
$result = Get-CCPCredential -AppID App -Safe Safe -Object ObjectName -URL https://pvwa
$result.ToCredential()
$credentials = $result.ToCredential()
# Creating session to CyberArk to create safe with credentials retrieved from Central Credential Provider.
New-PASSession -Credential $credentials -BaseURI https://pvwa
New-PASSession -Credential $credentials -BaseURI https://pvwa

Add-PASAccount

Add-PASAccount

- Create Account #1
- Set index and status.
- Create Account #2
- Set index and status.
- Create VirtualUserName
- Attach VirtualUserName to both accounts


>#
