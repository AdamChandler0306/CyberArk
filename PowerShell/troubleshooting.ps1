$user = Read-host -prompt "Enter the User Account"
If ($user)
{
  Write-Host "The user you entered is $User. Next we will verify the environment is setup correctly."
} else {
  Write-Host -Message "A User was not entered."
}

Test-Connection -ComputerName $machine | select -ExpandProperty PingSucceeded


If (# condition)
{
Get-ADUser -identity "" -properties * | select -ExpandProperty LockedOut
  # code
}
else
{

}

# Retrieve the credentials using the AAM CCP that will be used to authenticate to CyberArk.
$result = Get-CCPCredential -AppID Application -Safe SafeName -Object ObjectName -URL https://pvwa
$result.ToCredential()
$credentials = $result.ToCredential()
# Create a connection to the Production CyberArk Environment using the retreived credentials.
New-PASSession -Credential $credentials -BaseURI https://pvwa
get-PASAccount -Search "" | select -ExpandProperty SafeName
Get-ADUser -identity "" | Get-ADPrincipalGroupMember | where {$_.samaccountname -like "AD Group1"}
Get-ADUser -identity "" | Get-ADPrincipalGroupMember | where {$_.samaccountname -like "Safe AD Group"}
Get-LocalGroupMember -Group "Administrators"
is VDI pinging
is P account locked
what safe is p account in
is B member of all users
is B member of safe group
is ad group a member of builtin admin group
