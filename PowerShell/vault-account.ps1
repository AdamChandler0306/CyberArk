$result = Get-CCPCredential -AppID ApplicationName -Safe SafeName -Object account -URL https://pvwa
$result.ToCredential()
$Credentials = $result.ToCredential()
New-PASSession -Credential $Credentials -BaseURI https://pvwa
Add-PASAccount -Safe SafeName -PlatformID PlatformName -Address domain -username user
