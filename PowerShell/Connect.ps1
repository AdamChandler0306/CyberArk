$Credentials = Get-Credential
$token = New-PASSession -Credential $Credentials -BaseURI "https://cyberarkurl"
