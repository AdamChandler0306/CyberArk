Set-Location -Path ~\Desktop
$users = Get-Content names.txt
foreach ($user in $users)
{
    $Subject = "Update Subject"
    $Body = "Update Body"
    $ol = New-Object -comObject Outlook.Application
    $mail = $ol.CreateItem(0)
    $Mail.Recipients.Add("$user")
    $Mail.Recipients.Add("Recipient")
    $mail.Subject = "$Subject"
    $mail.HTMLBody="$Body"
    $mail.save()
}