$Credentials = Get-Credential
$token = New-PASSession -Credential $Credentials -BaseURI https://pvwa

$Credentials = Get-Credential
$token = New-PASSession -Credential $Credentials -type RADIUS -BaseURI https://pvwa